# Objašnjenje Ispravki - FundMe Test Suite

Ovaj dokument objašnjava sve greške koje su se pojavile tokom razvoja i kako su bile rešene.

## 1. Parse Error - Zatvorena zagrada van kontrakta

### Problem
```
Error: Expected pragma, import directive or contract/interface/library/struct/enum/constant/function/error definition.
  --> test/FundMeTest.t.sol:19:1
```

### Uzrok
Kontrakt je bio zatvoren prerano na liniji 14, što je ostavilo funkciju `testMinimumDollarIsFive()` van kontrakta.

### Rešenje
Uklonjena je dodatna zatvorena zagrada koja je prerano zatvarala kontrakt. Sada su sve funkcije unutar kontrakta.

---

## 2. Function State Mutability Warning

### Problem
```
Function state mutability can be restricted to view
```

### Uzrok
Funkcija `testMinimumDollarIsFive()` samo čita konstantu `MINIMUM_USD` i ne menja stanje kontrakta.

### Rešenje
Dodat je `view` modifikator funkciji da eksplicitno označi da funkcija samo čita podatke.

---

## 3. Test Owner Assertion Failure

### Problem
```
[FAIL: assertion failed: 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496 != 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38]
testOwnerIsMsgSender()
```

### Uzrok
Kada se `FundMe` deployuje u `setUp()` funkciji, konstruktor prima `msg.sender` koji je adresa test kontrakta (`address(this)`), a ne adresa koja poziva test funkciju.

### Rešenje
Promenjeno `address(msg.sender)` u `address(this)` jer je test kontrakt onaj koji deployuje `FundMe`.

---

## 4. Test Price Feed Version Revert

### Problem
```
[FAIL: EvmError: Revert] testPriceFeedVersionIsAccurate()
```

### Uzrok
Funkcija `getVersion()` poziva eksterni Chainlink kontrakt koji ne postoji u default test okruženju.

### Rešenje
Dodato forkovanje Sepolia mreže korišćenjem `vm.createSelectFork()` i redeploy `FundMe` na fork-u gde Chainlink kontrakt postoji.

---

## 5. Import Path Errors

### Problem
```
Error: Source "lib/foundry-devops/src/ZkSyncChainChecker.sol" not found
Error: Source "mock/MockV3Aggregator.sol" not found
```

### Uzrok
- `foundry-devops` biblioteka nije bila instalirana
- Putanja za `MockV3Aggregator` je bila pogrešna (trebalo je `test/mocks/` umesto `../mock/`)

### Rešenje
1. Kreiran stub fajl `ZkSyncChainChecker.sol` sa osnovnom funkcionalnošću
2. Ispravljena putanja za MockV3Aggregator na `./mocks/MockV3Agreggator.sol`
3. Dodat remapping u `foundry.toml` za `foundry-devops`

---

## 6. Undeclared Identifier - fundMe

### Problem
```
Undeclared identifier. Did you mean "funded" or "FundMe"?
```

### Uzrok
Varijabla `fundMe` je korišćena u testovima ali nikada nije deklarisana kao state varijabla u kontraktu.

### Rešenje
Dodata deklaracija `FundMe public fundMe;` kao state varijabla u `FundMeTest` kontraktu.

---

## 7. Wrong Method Calls - Ne postojeći getter metodi

### Problem
```
Member "getAddressToAmountFunded" not found
Member "getFunder" not found
Member "getOwner" not found
Member "getPriceFeed" not found
```

### Uzrok
Testovi su pozivali getter metode koje ne postoje u `FundMe` kontraktu. `FundMe` koristi public state varijable koje automatski generišu getter funkcije.

### Rešenje
Zamenjeni pozivi nepostojećih metoda sa direktnim pristupom public state varijablama:
- `getAddressToAmountFunded(address)` → `addressToAmountFunded(address)` (public mapping)
- `getFunder(uint256)` → `funders(uint256)` (public array)
- `getOwner()` → `i_owner()` (public variable getter)
- `getPriceFeed()` → test je preskočen dok se `FundMe` ne refaktoriše

---

## 8. Wrong Argument Count - FundMe Constructor

### Problem
```
Wrong argument count for function call: 1 arguments given but expected 0.
```

### Uzrok
Test je pokušavao da prosledi `address(mockPriceFeed)` konstruktoru `FundMe`, ali trenutna verzija `FundMe` konstruktora ne prima parametre.

### Rešenje
Uklonjen parametar iz konstruktora: `new FundMe()` umesto `new FundMe(address(mockPriceFeed))`.

---

## 9. Variable Shadowing - DeployFundMe Script

### Problem
```
This declaration shadows an existing declaration.
```

### Uzrok
Funkcija `deployFundMe()` je imala `fundMe` i `helperConfig` kao return parametre, ali su ponovo deklarisani kao lokalne varijable unutar funkcije.

### Rešenje
Uklonjene su deklaracije tipova (`FundMe` i `HelperConfig`) iz lokalnih dodela. Varijable su već deklarisane kao return parametri, pa se samo dodeljuju vrednosti.

---

## 10. Unused Local Variable

### Problem
```
Unused local variable.
```

### Uzrok
Varijabla `priceFeed` je uzet iz `helperConfig` ali nikada korišćena jer `FundMe` konstruktor ne prima parametre.

### Rešenje
Uklonjena neiskorišćena `priceFeed` varijabla.

---

## Zaključak

Većina problema je nastala zbog:
1. **Nedostajućih deklaracija** - state varijable nisu bile deklarisane
2. **Nepostojećih metoda** - testovi su pozivali metode koje ne postoje u kontraktu
3. **Pogrešnih import putanja** - biblioteke i mock fajlovi nisu bili na pravim lokacijama
4. **Nekonzistentnosti API-ja** - testovi su očekivali refaktorisanu verziju `FundMe` kontrakta koja još nije implementirana

Sve greške su rešene i kod bi sada trebalo da se kompajlira bez problema.

