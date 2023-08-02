//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {StringsArrayUtilsLib} from "./array-utils/StringsArrayUtilsLib.sol";

contract Sample {
    using StringsArrayUtilsLib for string[];

    function exampleCheckIncludes() public pure returns (bool) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "abnc";
        array[3] = "pal";
        array[4] = "pap";
        array[5] = "mik";
        array[6] = "bo";

        return array.includes("example");
    }

    function exampleCheckCompare() public pure returns (bool) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "abnc";
        array[3] = "pal";
        array[4] = "pap";
        array[5] = "mik";
        array[6] = "bo";

        string[] memory array1 = new string[](7);
        array1[0] = "example";
        array1[1] = "text";
        array1[2] = "abnc";
        array1[3] = "pal";
        array1[4] = "pap";
        array1[5] = "mik";
        array1[6] = "bo";

        return array.compareArray(array1);
    }

    function exampleIsSubArray() public pure returns (bool) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "abnc";
        array[3] = "pal";
        array[4] = "pap";
        array[5] = "mik";
        array[6] = "bo";

        string[] memory array1 = new string[](3);
        array1[0] = "example";
        array1[1] = "text";
        array1[2] = "abnc";

        return array.isSubArray(array1);
    }

    function exampleJoinArray() public pure returns (string[] memory) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "abnc";
        array[3] = "pal";
        array[4] = "pap";
        array[5] = "mik";
        array[6] = "bo";

        string[] memory array1 = new string[](7);
        array1[0] = "example";
        array1[1] = "text";
        array1[2] = "abnc";
        array1[3] = "pal";
        array1[4] = "pap";
        array1[5] = "mik";
        array1[6] = "bo";

        return array.join(array1);
    }

    function exampleReplaceOne() public pure returns (string[] memory) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";

        return array.replaceOne("example", "ab");
    }

    function exampleReplaceAll() public pure returns (string[] memory) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";

        return array.replaceAll("example", "ab");
    }

    function exampleStringAtIndex() public pure returns (string memory) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";

        return array.dataAt(4);
    }

    function exampleIndexOfString() public pure returns (uint256) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";

        return array.indexOf("pal");
    }

    function exampleAIndexOfString() public pure returns (uint256) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";

        return array.lastIndexOf("example");
    }

    function exampleAllIndexOfString() public pure returns (uint256[] memory) {
        string[] memory array = new string[](7);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";

        return array.allIndexOf("example");
    }

    function exampleSplitByNumber() public pure returns (string[][] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "text";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "example";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.splitByNumber(2);
    }

    function exampleSplitByDataA() public pure returns (string[][] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.splitByDataInclusive("text");
    }

    function exampleSplitByDataC() public pure returns (string[][] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.splitByDataExclusive("text");
    }

    function exampleReverseArray() public pure returns (string[] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.reverse();
    }

    function exampleArrayAb() public pure returns (string[] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.slice(2, 4);
    }

    function exampleSubArray() public pure returns (string[] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.subArray(2, 4);
    }

    function exampleShiftArray()
        public
        pure
        returns (string memory, string[] memory)
    {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.shift();
    }

    function examplePopArray()
        public
        pure
        returns (string memory, string[] memory)
    {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.pop();
    }

    function exampleTrimStartArray() public pure returns (string[] memory) {
        string[] memory array = new string[](8);
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.trimStart();
    }

    function exampleTrimEndArray() public pure returns (string[] memory) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";

        return array.trimEnd();
    }

    function exampleTrimArray() public pure returns (string[] memory) {
        string[] memory array = new string[](8);
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";

        return array.trim();
    }

    function exampleLengthArray() public pure returns (uint256) {
        string[] memory array = new string[](8);
        array[0] = "example";
        array[1] = "asas";
        array[2] = "example";
        array[3] = "pal";
        array[4] = "text";
        array[5] = "mik";
        array[6] = "bo";
        array[7] = "bo";

        return array.lengthArray();
    }
}
