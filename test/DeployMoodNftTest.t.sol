// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

function setUp() public {
deployer = new DeployMoodNft();
}

function testConvertSvgToUri() public view {
    string memory expectedUri = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    string memory svg = "<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'><rect
    string memory actualUri = deployer.svgToImageURI(svg);
    assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
}
}