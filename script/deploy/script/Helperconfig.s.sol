//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {

    function getSepoliaEthConfig() public pure {

        HelperConfig config = new HelperConfig();
        return config.getSepoliaEthConfig();
    }
