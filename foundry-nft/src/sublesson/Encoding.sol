// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// For the cheatsheet, check out the docs: https://docs.soliditylang.org/en/v0.8.13/cheatsheet.html?highlight=encodewithsignature

contract Encoding {
    function combineStrings() public pure returns (string memory) {
        return string(abi.encodePacked("hello", "world"));
    }

    function encodeNumber() public pure returns (bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    // You'd use this to make calls to contracts
    function encodeString() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("some string");
        return someString;
    }

    // https://forum.openzeppelin.com/t/difference-between-abi-encodepacked-string-and-bytes-string/11837
    // encodePacked 压缩空间
    function encodeStringPacked() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked("some string");
        return someString;
    }

    // This is just type casting to string
    // It's slightly different from below, and they have different gas costs
    function encodeStringBytes() public pure returns (bytes memory) {
        bytes memory someString = bytes("some string");
        return someString;
    }

    function decodeString() public pure returns (string memory) {
        string memory someString = abi.decode(encodeString(), (string));
        return someString;
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("some string", "it's bigger!");
        return someString;
    }

    // Gas: 24612
    function multiDecode() public pure returns (string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(
            multiEncode(),
            (string, string)
        );
        return (someString, someOtherString);
    }

    function multiEncodePacked() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked(
            "some string",
            "it's bigger!"
        );
        return someString;
    }

    // This doesn't work!
    function multiDecodePacked() public pure returns (string memory) {
        string memory someString = abi.decode(multiEncodePacked(), (string));
        return someString;
    }

    // This does!
    // Gas: 22313
    function multiStringCastPacked() public pure returns (string memory) {
        string memory someString = string(multiEncodePacked());
        return someString;
    }
}