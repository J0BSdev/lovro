# POTPUNA DOKUMENTACIJA - SimpleStorage Contract

## Linija po liniju objašnjenje sa svakim znakom

---

### LINIJA 1: `//SPDX-License-Identifier:MIT`

**Svaki znak objašnjen:**
- `//` - **Dvije kosolinije**: Počinje komentar u Solidity-u. Sve što je nakon `//` do kraja linije se ignorira pri kompajliranju
- `SPDX-License-Identifier` - **SPDX** je standard za označavanje licenci koda
  - `SPDX` = Software Package Data Exchange (standardizirani način označavanja licenci)
- `:` - **Dvotočka**: Odvaja oznaku od vrijednosti
- `MIT` - **MIT License**: Ime licence koja dozvoljava slobodnu upotrebu koda

**Zašto postoji:** 
- Solidity kompajler zahtijeva eksplicitnu deklaraciju licence (ili upozorenje o njenoj odsutnosti)
- Koristi se za legalnu transparentnost i automatizirane alate za provjeru licenci

---

### LINIJA 2: `pragma solidity ^0.8.19;`

**Svaki znak objašnjen:**
- `pragma` - **Ključna riječ**: Specificira verziju Solidity kompajlera koja se koristi
  - `pragma` = direktiva koja daje instrukcije kompajleru prije kompajliranja
- `solidity` - **Jezik**: Specificira da se radi o Solidity programu
- `^` - **Caret simbol**: U verzijskom semver sistemu znači "kompatibilno sa verzijom 0.8.19 ili novijom, ali ispod 0.9.0"
  - `^0.8.19` = može koristiti 0.8.19, 0.8.20, 0.8.21... ali NE 0.9.0 ili više
- `0.8.19` - **Verzija**: Konkretna verzija Solidity jezika
- `;` - **Točka-zarez**: Završava statement/izjavu u Solidity-u

**Zašto postoji:**
- Kompajler mora znati koju verziju Solidity sintakse koristi, jer se jezik razvija
- `^` osigurava kompatibilnost s novijim patch verzijama (sigurnosni updatei)

---

### LINIJA 3: (prazna linija)

- **Prazan prostor**: Koristi se samo za čitljivost koda (formatiranje)

---

### LINIJA 4: `contract SimpleStorage {`

**Svaki znak objašnjen:**
- `contract` - **Ključna riječ**: Definira smart contract (ugovor na blockchainu)
  - U Solidity-u, contract je osnovna jedinica koda koja može držati podatke i funkcije
- `SimpleStorage` - **Ime contracta**: Identifikator ovog specifičnog contracta
  - Po konvenciji: PascalCase (prvo slovo veliko, svaki novi riječ počinje velikim slovom)
- `{` - **Otvorena vitičasta zagrada**: Počinje tijelo (body) contracta
  - Sve što je unutar `{ }` pripada ovom contractu

**Što je contract:**
- Smart contract = samostalni program koji živi na blockchainu
- Ima svoju adresu i može držati ETH/tokeni i izvršavati logiku

---

### LINIJA 5: `  //favoriteNumber gets initialized to 0 if no value is given`

**Svaki znak objašnjen:**
- `  ` - **Dva space karaktera**: Uvlačenje (indentation) za čitljivost
- `//` - **Komentar**: Sve nakon ovoga se ignorira
- **Ostatak teksta**: Objašnjenje za čitljivost koda na engleskom

**Značenje komentara:** 
- Varijabla favoriteNumber će biti inicijalizirana na 0 ako se ne postavi vrijednost

---

### LINIJA 6: (prazna linija)

- **Formatiranje**: Prazan red za bolju čitljivost

---

### LINIJA 7: ` uint256 public myFavoriteNumber; //0`

**Svaki znak objašnjen:**
- ` ` - **Space**: Uvlačenje
- `uint256` - **Tip podatka**: 
  - `uint` = Unsigned Integer (pozitivni cijeli broj bez znaka)
  - `256` = broj bitova za pohranu (256 bita = 32 bajta)
  - Moguće vrijednosti: 0 do 2^256 - 1 (ogromna vrijednost)
  - `uint256` je sinonim za `uint` u Solidity-u
- `public` - **Vidljivost/access modifier**: 
  - Automatski kreira getter funkciju koju svi mogu pozvati
  - Varijabla je vidljiva izvana contracta
- `myFavoriteNumber` - **Ime varijable**: 
  - camelCase konvencija (prvo slovo malo)
  - Identifikator varijable koja drži vrijednost
- `;` - **Terminator**: Završava deklaraciju varijable
- `//0` - **Komentar**: Objašnjava da je default vrijednost 0

**Što ova linija radi:**
- Kreira javnu varijablu koja može držati pozitivan cijeli broj
- Po defaultu vrijednost je 0
- Automatski generira getter funkciju: `myFavoriteNumber()`

---

### LINIJA 8: (prazna linija)

---

### LINIJA 9: `//uint256[] listOfFavoriteNumbers;`

**Svaki znak:**
- `//` - **Komentar**: Linija je zakomentirana (ne izvršava se)
- `uint256[]` - **Array tip**: 
  - `uint256` = tip elemenata
  - `[]` = označava da je ovo array (lista) elemenata
  - Nije navedena veličina, pa je dinamički array
- `listOfFavoriteNumbers` - **Ime varijable**: Imenovana lista brojeva
- `;` - **Terminator**

**Zašto je zakomentirana:**
- Vjerovatno je bila testna/korišćena prije, ali trenutno nije u upotrebi

---

### LINIJA 10: `struct Person {`

**Svaki znak:**
- `struct` - **Ključna riječ**: Definira custom tip podatka (strukturu)
  - `struct` = način grupisanja različitih tipova podataka u jednu logičku jedinicu
- `Person` - **Ime strukture**: PascalCase ime
- `{` - **Počinje tijelo strukture**

**Što je struct:**
- Korisnički definirani tip podatka
- Kombinuje više varijabli u jednu logičku cjelinu
- Slično kao objekt u drugim jezicima

---

### LINIJA 11: `    uint256 favoriteNumber;`

**Svaki znak:**
- `    ` - **Četiri space-a**: Uvlačenje unutar strukture
- `uint256` - **Tip**: Pozitivan cijeli broj (256 bita)
- `favoriteNumber` - **Ime polja**: Član strukture Person
- `;` - **Terminator**

**Značenje:**
- Svaki `Person` ima polje `favoriteNumber` tipa `uint256`

---

### LINIJA 12: `    string name;`

**Svaki znak:**
- `    ` - **Uvlačenje**
- `string` - **Tip podatka**: Niz karaktera (tekst)
  - `string` u Solidity-u je dinamički array bajtova
  - Može držati bilo koji tekst (imena, adrese, itd.)
- `name` - **Ime polja**: Drugi član strukture Person
- `;` - **Terminator**

**Značenje:**
- Svaki `Person` ima polje `name` tipa `string`

---

### LINIJA 13: `}`

**Znak:**
- `}` - **Zatvorena vitičasta zagrada**: Završava definiciju `struct Person`

**Rezultat:**
- Sada postoji custom tip `Person` sa dva polja:
  ```
  Person {
      uint256 favoriteNumber;
      string name;
  }
  ```

---

### LINIJA 14: `// dynamic array`

**Svaki znak:**
- `//` - **Komentar**
- `dynamic array` - **Objašnjenje**: Dinamički array može rasti ili smanjivati se

---

### LINIJA 15: ` //static array`

**Svaki znak:**
- ` ` - **Space**: Uvlačenje
- `//` - **Komentar**
- `static array` - **Objašnjenje**: Statički array ima fiksnu veličinu

**Razlika:**
- Dynamic: `uint256[]` (veličina se mijenja)
- Static: `uint256[5]` (uvijek 5 elemenata)

---

### LINIJA 16: `Person[] public listOfPeople; //empty array []`

**Svaki znak:**
- `Person[]` - **Tip array-a**: 
  - `Person` = tip elemenata (struktura koju smo definirali)
  - `[]` = dinamički array (bez fiksne veličine)
- `public` - **Vidljivost**: Javna varijabla, automatski getter
- `listOfPeople` - **Ime varijable**: Lista ljudi
- `;` - **Terminator**
- `//empty array []` - **Komentar**: Početna vrijednost je prazan array

**Što radi:**
- Kreira javnu listu struktura `Person`
- Početno je prazna lista: `[]`
- Može se dodavati/uklanjati elementi

---

### LINIJA 17: (prazna linija)

---

### LINIJA 18: (prazna linija)

---

### LINIJA 19: `mapping(string => uint256) public nameToFavoriteNumber;`

**Svaki znak:**
- `mapping` - **Ključna riječ**: Hash tablica/dictionary struktura
  - `mapping` = struktura podataka koja mapira ključeve na vrijednosti
  - Vrlo efikasna za pretrage (O(1) kompleksnost)
- `(` - **Otvorena zagrada**: Počinje definiciju mapping tipa
- `string` - **Tip ključa**: Ključevi su string tipa (imena)
- `=>` - **Strelica**: Mapira "na" (key => value)
- `uint256` - **Tip vrijednosti**: Vrijednosti su pozitivni cijeli brojevi
- `)` - **Zatvorena zagrada**: Završava definiciju tipa
- `public` - **Vidljivost**: Automatski getter funkcija
- `nameToFavoriteNumber` - **Ime varijable**: Mapping od imena do broja
- `;` - **Terminator**

**Što radi:**
- Kreira hash tablicu koja povezuje string (ime) sa uint256 (broj)
- Primjer: `nameToFavoriteNumber["Alice"] = 42`
- Automatski generira getter: `nameToFavoriteNumber(string) returns (uint256)`

**Kako funkcionira:**
- Input: `string` (ime osobe)
- Output: `uint256` (njen omiljeni broj)

---

### LINIJA 20: (prazna linija)

---

### LINIJA 21: `// Person public pat = Person({favoriteNumber:7, name: "Pat"});`

**Svaki znak:**
- `//` - **Komentar**: Zakomentirana linija
- `Person` - **Tip**: Koristi strukturu Person
- `public` - **Vidljivost**: Javna varijabla
- `pat` - **Ime varijable**: Konkretna instanca
- `=` - **Operator dodjeljivanja**: Dodjeljuje vrijednost
- `Person({` - **Konstruktor strukture**: Kreira novu Person strukturu
  - `Person(` = poziv konstruktora
  - `{` = počinje inicijalizaciju polja
- `favoriteNumber:7` - **Prvo polje**: 
  - `favoriteNumber` = ime polja
  - `:` = separator između imena polja i vrijednosti
  - `7` = vrijednost koja se dodjeljuje
- `,` - **Zarez**: Razdvaja polja strukture
- `name: "Pat"` - **Drugo polje**:
  - `name` = ime polja
  - `:` = separator
  - `"Pat"` = string literal (tekst između navodnika)
  - `"` = navodnici označavaju string literal
- `})` - **Završava inicijalizaciju**:
  - `}` = zatvara inicijalizaciju polja
  - `)` = zatvara konstruktor
- `;` - **Terminator**

**Što bi radila (kad bi nije bila zakomentirana):**
- Kreirala bi javnu varijablu `pat` tipa `Person`
- Inicijalizirana sa: `favoriteNumber = 7`, `name = "Pat"`

---

### LINIJA 22: `//person public mariah=Person({favoriteNumber:10, name: "Mariah"});;`

**Svaki znak:**
- `//` - **Komentar**: Zakomentirana
- `person` - **Napomena**: Trebalo bi biti `Person` (veliko P), jer je to ime strukture
  - Solidity je case-sensitive
- `public` - **Vidljivost**
- `mariah` - **Ime varijable**: Druga instanca
- `=` - **Dodjeljivanje**
- `Person({favoriteNumber:10, name: "Mariah"})` - **Konstruktor**: Slično kao gore
  - `10` = decimalni broj (integer literal)
  - `"Mariah"` = string literal
- `;;` - **Dvije točke-zarez**: 
  - Prva `;` = završava statement
  - Druga `;` = suvišna (sintaksna greška ako nije komentar)

**Greške u kodu:**
- `person` umjesto `Person` (greška ako nije komentar)
- `;;` = dupli terminator (ne bi prošlo kompajliranje)

---

### LINIJA 23: (prazna linija)

---

### LINIJA 24: ` function store (uint256 _favoriteNumber) public {`

**Svaki znak:**
- ` ` - **Space**: Uvlačenje
- `function` - **Ključna riječ**: Definira funkciju
  - `function` = blok koda koji se može pozvati i izvršiti
- `store` - **Ime funkcije**: 
  - camelCase konvencija
  - Identifikator funkcije
- `(` - **Otvorena zagrada**: Počinje listu parametara
- `uint256` - **Tip parametra**: Pozitivan cijeli broj
- `_favoriteNumber` - **Ime parametra**: 
  - `_` = prefix koji označava parametar funkcije (konvencija)
  - `_favoriteNumber` = vrijednost koja se prosljeđuje funkciji
- `)` - **Zatvorena zagrada**: Završava listu parametara
- `public` - **Vidljivost**: 
  - Funkciju mogu pozvati svi (unutar contracta i izvana)
  - Mogu je pozvati korisnici i drugi contracti
- `{` - **Otvorena zagrada**: Počinje tijelo funkcije

**Što funkcija radi:**
- Prima jedan parametar: `_favoriteNumber` (uint256)
- Javna je, može se pozvati iz bilo koje adrese
- Modificira stanje contracta (state-changing function)

---

### LINIJA 25: `     myFavoriteNumber = _favoriteNumber;`

**Svaki znak:**
- `     ` - **Pet space-a**: Uvlačenje unutar funkcije
- `myFavoriteNumber` - **Varijabla contracta**: Varijabla definirana na liniji 7
- `=` - **Operator dodjeljivanja**: 
  - `=` = assignment operator
  - Dodjeljuje vrijednost s desne strane varijabli s lijeve strane
- `_favoriteNumber` - **Parametar**: Vrijednost proslijeđena funkciji
- `;` - **Terminator**: Završava statement

**Što radi:**
- Postavlja `myFavoriteNumber` na vrijednost `_favoriteNumber`
- Modificira stanje contracta (zahtijeva transakciju)

---

### LINIJA 26: (prazna linija, samo whitespace)

---

### LINIJA 27: ` }`

**Svaki znak:**
- ` ` - **Space**: Uvlačenje
- `}` - **Zatvorena zagrada**: Završava tijelo funkcije `store`

---

### LINIJA 28: (prazna linija)

---

### LINIJA 29: `//view ,pure`

**Svaki znak:**
- `//` - **Komentar**
- `view` - **Funkcija modificator**: 
  - `view` = funkcija koja čita stanje, ali ga ne mijenja
  - Ne troši gas (ako se pozove izvana bez transakcije)
- `,` - **Zarez**: Razdvaja dva koncepta
- `pure` - **Funkcija modificator**: 
  - `pure` = funkcija koja ne čita niti mijenja stanje contracta
  - Potpuno deterministička, samo radi kalkulacije
  - Najjeftinija opcija (gas-wise)

**Razlika:**
- `view`: Čita stanje (varijable contracta)
- `pure`: Ne čita niti mijenja stanje
- (bez modifikatora): Mijenja stanje

---

### LINIJA 30: `function retrieve() public view returns(uint256){`

**Svaki znak:**
- `function` - **Ključna riječ**: Definira funkciju
- `retrieve` - **Ime funkcije**: Dobavlja vrijednost
- `()` - **Prazne zagrade**: Funkcija nema parametara
- `public` - **Vidljivost**: Javna funkcija
- `view` - **Modificator**: 
  - Čita stanje contracta (varijablu `myFavoriteNumber`)
  - Ne mijenja stanje
  - Ne troši gas (ako se pozove lokalno)
- `returns` - **Ključna riječ**: Označava da funkcija vraća vrijednost
  - `returns` = definiše return tip funkcije
- `(` - **Otvorena zagrada**: Počinje listu return tipova
- `uint256` - **Return tip**: Funkcija vraća pozitivan cijeli broj
- `)` - **Zatvorena zagrada**: Završava listu return tipova
- `{` - **Otvorena zagrada**: Počinje tijelo funkcije

**Što funkcija radi:**
- Čita vrijednost `myFavoriteNumber`
- Vraća je kao rezultat
- Ne mijenja stanje (view funkcija)

---

### LINIJA 31: `    return myFavoriteNumber;`

**Svaki znak:**
- `    ` - **Uvlačenje**: Četiri space-a
- `return` - **Ključna riječ**: Vraća vrijednost iz funkcije
  - `return` = prekida izvršavanje funkcije i vraća vrijednost
- `myFavoriteNumber` - **Vrijednost za povrat**: Varijabla contracta
- `;` - **Terminator**: Završava return statement

**Što radi:**
- Vraća trenutnu vrijednost `myFavoriteNumber` varijable

---

### LINIJA 32: `}`

**Znak:**
- `}` - **Zatvorena zagrada**: Završava funkciju `retrieve`

---

### LINIJA 33: `//calldata,memory,storage`

**Svaki znak:**
- `//` - **Komentar**
- `calldata` - **Data lokacija**: 
  - `calldata` = read-only podaci koji dolaze iz funkcije poziva
  - Može se koristiti samo za parametre funkcije (ne za lokalne varijable)
  - Ne može se modificirati
  - Najjeftiniji za external/public funkcije
- `,` - **Zarez**: Razdvaja koncepte
- `memory` - **Data lokacija**: 
  - `memory` = privremena pohrana tijekom izvršavanja funkcije
  - Podaci se brišu nakon završetka funkcije
  - Mogu se modificirati
  - Koristi se za reference tipove (array, string, struct) u funkcijama
- `,` - **Zarez**
- `storage` - **Data lokacija**: 
  - `storage` = trajna pohrana na blockchainu
  - Podaci ostaju i nakon završetka funkcije
  - Najskuplji (gas-wise)
  - Default za state varijable

**Data lokacije:**
- `calldata`: Read-only parametri (najjeftiniji za external funkcije)
- `memory`: Privremeno (za reference tipove u funkcijama)
- `storage`: Trajno (za state varijable)

---

### LINIJA 34: `    function addPerson( string memory _name, uint256 _favoriteNumber) public {`

**Svaki znak:**
- `    ` - **Uvlačenje**: Četiri space-a
- `function` - **Ključna riječ**: Definira funkciju
- `addPerson` - **Ime funkcije**: Dodaje osobu u listu
- `(` - **Otvorena zagrada**: Počinje parametre
- `string` - **Tip prvog parametra**: String (niz karaktera)
- `memory` - **Data lokacija**: 
  - `string` je reference tip, mora imati data lokaciju
  - `memory` = privremena kopija (može se modificirati unutar funkcije)
  - Alternativa: `calldata` (read-only, jeftinije)
- `_name` - **Ime prvog parametra**: Ime osobe (string)
- `,` - **Zarez**: Razdvaja parametre
- `uint256` - **Tip drugog parametra**: Pozitivan cijeli broj
- `_favoriteNumber` - **Ime drugog parametra**: Omiljeni broj osobe
  - **Napomena**: `uint256` je value tip, ne treba data lokaciju (automatski se kopira)
- `)` - **Zatvorena zagrada**: Završava parametre
- `public` - **Vidljivost**: Javna funkcija
- `{` - **Otvorena zagrada**: Počinje tijelo funkcije

**Zašto `memory` za string:**
- `string` je reference tip (dynamički array)
- Reference tipovi (string, array, struct) moraju imati eksplicitnu data lokaciju
- `memory` = privremena kopija unutar funkcije (može se modificirati)

---

### LINIJA 35: `        listOfPeople.push(Person(_favoriteNumber, _name));`

**Svaki znak:**
- `        ` - **Uvlačenje**: Osam space-a (dvostruko uvlačenje unutar funkcije)
- `listOfPeople` - **Array varijabla**: Dinamički array Person struktura (definiran na liniji 16)
- `.` - **Dot operator**: Pristupa metodi objekta
  - `.` = separator između objekta i metode/svojstva
- `push` - **Array metoda**: Dodaje element na kraj array-a
  - `push()` = built-in metoda za dinamičke array-eve
  - Dodaje jedan element na kraj liste
- `(` - **Otvorena zagrada**: Počinje argument za push metodu
- `Person` - **Ime strukture**: Tip elementa koji se dodaje
- `(` - **Otvorena zagrada**: Počinje konstruktor strukture
  - `Person()` = poziv konstruktora za kreiranje nove Person instance
- `_favoriteNumber` - **Prvi argument konstruktora**: 
  - Dodjeljuje se prvom polju strukture (`favoriteNumber`)
  - Redoslijed mora odgovarati redoslijedu definicije u struct
- `,` - **Zarez**: Razdvaja argumente konstruktora
- `_name` - **Drugi argument konstruktora**: 
  - Dodjeljuje se drugom polju strukture (`name`)
- `)` - **Zatvorena zagrada**: Završava konstruktor Person
  - Zatvara `Person()` konstruktor
- `)` - **Zatvorena zagrada**: Završava argument za push metodu
  - Zatvara `push()` poziv
- `;` - **Terminator**: Završava statement

**Što radi:**
- Kreira novu `Person` strukturu sa `_favoriteNumber` i `_name`
- Dodaje je na kraj `listOfPeople` array-a
- Array raste za 1 element

**Redoslijed u Person strukturi:**
- U struct definiciji (linija 10-13):
  1. `uint256 favoriteNumber;` (prvi)
  2. `string name;` (drugi)
- U konstruktoru: `Person(_favoriteNumber, _name)` odgovara ovom redoslijedu

---

### LINIJA 36: (prazna linija)

---

### LINIJA 37: `        nameToFavoriteNumber[_name] = _favoriteNumber;`

**Svaki znak:**
- `        ` - **Uvlačenje**: Osam space-a
- `nameToFavoriteNumber` - **Mapping varijabla**: Mapping definiran na liniji 19
- `[` - **Otvorena uglata zagrada**: Indexer operator
  - `[ ]` = pristupa elementu mapping-a po ključu
- `_name` - **Ključ**: String koji se koristi kao ključ za pretragu/pohranu
  - Vrijednost proslijeđena funkciji
- `]` - **Zatvorena uglata zagrada**: Završava indexer
- `=` - **Operator dodjeljivanja**: Postavlja vrijednost u mapping
- `_favoriteNumber` - **Vrijednost**: Broj koji se pohranjuje pod ključem `_name`
- `;` - **Terminator**: Završava statement

**Što radi:**
- Postavlja mapping `nameToFavoriteNumber[_name]` na `_favoriteNumber`
- Kreira ili ažurira unos u hash tablici
- Omogućava brzu pretragu: `nameToFavoriteNumber["Alice"]` će vratiti njen broj

**Primjer:**
- Ako je `_name = "Alice"` i `_favoriteNumber = 42`
- Ova linija postavlja: `nameToFavoriteNumber["Alice"] = 42`

---

### LINIJA 38: `    }`

**Znak:**
- `    ` - **Uvlačenje**: Četiri space-a
- `}` - **Zatvorena zagrada**: Završava funkciju `addPerson`

---

### LINIJA 39-42: (prazne linije)

- **Formatiranje**: Prazni redovi za čitljivost

---

### LINIJA 43: `}`

**Znak:**
- `}` - **Zatvorena vitičasta zagrada**: **ZAVRŠAVA SIMPLESTORAGE CONTRACT**
- Ova zagrada zatvara contract koji je započeo na liniji 4

---

## SAŽETAK CONTRACTA

### Što contract radi:

1. **Pohranjuje jedan omiljeni broj** (`myFavoriteNumber`)
   - Može se postaviti funkcijom `store()`
   - Može se pročitati funkcijom `retrieve()`

2. **Upravlja listom ljudi** (`listOfPeople`)
   - Svaka osoba ima ime i omiljeni broj
   - Funkcija `addPerson()` dodaje novu osobu

3. **Omogućava brzu pretragu po imenu** (`nameToFavoriteNumber`)
   - Mapping povezuje ime osobe sa njenim omiljenim brojem
   - Brza pretraga O(1) kompleksnost

### Funkcije:

- **`store(uint256 _favoriteNumber)`**: Postavlja globalni omiljeni broj
- **`retrieve()`**: Vraća globalni omiljeni broj (view funkcija)
- **`addPerson(string memory _name, uint256 _favoriteNumber)`**: Dodaje osobu u listu i mapping

### Varijable:

- **`myFavoriteNumber`** (uint256, public): Javni omiljeni broj
- **`listOfPeople`** (Person[], public): Lista svih osoba
- **`nameToFavoriteNumber`** (mapping, public): Brza pretraga ime -> broj

---

## KLJUČNI KONCEPTI

### 1. **State Varijable** (Stanje Contracta)
- Varijable definirane na nivou contracta
- Pohranjuju se trajno na blockchainu
- Svaka promjena zahtijeva transakciju (troši gas)

### 2. **Struct** (Struktura)
- Custom tip podatka
- Kombinuje više polja u jednu logičku cjelinu
- Slično kao objekt u OOP jezicima

### 3. **Array** (Niz)
- Dinamički array: `Person[]` (mijenja veličinu)
- Statički array: `Person[10]` (fiksna veličina)

### 4. **Mapping** (Hash Tablica)
- Key-value parovi
- Vrlo efikasna pretraga
- Svi mogući ključevi postoje (default vrijednost: 0)

### 5. **Funkcija Modificatori**
- `public`: Vidljiva svima
- `view`: Čita stanje (ne mijenja)
- `pure`: Ne čita niti mijenja stanje

### 6. **Data Lokacije**
- `storage`: Trajno (state varijable)
- `memory`: Privremeno (u funkcijama)
- `calldata`: Read-only parametri (najjeftinije)

---

**KRAJ DOKUMENTACIJE**

