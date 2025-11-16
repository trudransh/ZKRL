// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import { console2 } from "forge-std/console2.sol";
import { IdentityRegistry } from "../src/IdentityRegister.sol";
import { UserFactory } from "../src/factories/UserFactory.sol";

contract IdentityRegistryScript is Script {
    function run() public {
        uint256 deployerKey = vm.envUint("RUDRANSH_TEST_PRIVATE_KEY");
        vm.startBroadcast(deployerKey);

        // Read network-specific params from environment for flexibility across chains
        address zkVerify = vm.envAddress("BASECAMP_ZKVERIFY");
        bytes32 vkey = vm.envBytes32("BASECAMP_VKEY");

        UserFactory uf = new UserFactory();
        address userFactory = address(uf);

        IdentityRegistry identityRegistry = new IdentityRegistry(zkVerify, vkey, userFactory);
        vm.stopBroadcast();

        console2.log("UserFactory deployed to:", userFactory);
        console2.log("IdentityRegistry deployed to:", address(identityRegistry));
    }
}