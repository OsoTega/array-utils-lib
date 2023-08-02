//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {Sample} from "../src/Sample.sol";

contract StringArrayUtilsLibTest is Test {
    Sample sample;

    function setUp() external {
        sample = new Sample();
    }

    function testIncludes() public {
        bool a = sample.exampleCheckIncludes();
        assertEq(a, true);
    }

    function testCompareArray() public {
        bool a = sample.exampleCheckCompare();
        assertEq(a, true);
    }

    function testIsSubArray() public {
        bool a = sample.exampleIsSubArray();
        assertEq(a, true);
    }

    function testJoinArray() public {
        string[] memory a = sample.exampleJoinArray();
        assertEq(a[13], "bo");
    }

    function testReplaceOne() public {
        string[] memory a = sample.exampleReplaceOne();
        assertEq(a[0], "ab");
    }

    function testReplaceAll() public {
        string[] memory a = sample.exampleReplaceAll();
        assertEq(a[0], "ab");
    }

    function testStringAt() public {
        string memory a = sample.exampleStringAtIndex();
        assertEq(a, "example");
    }

    function testIndexof() public {
        uint256 a = sample.exampleIndexOfString();
        assertEq(a, 3);
    }

    function testAIndexof() public {
        uint256 a = sample.exampleAIndexOfString();
        assertEq(a, 4);
    }

    function testAllIndexof() public {
        uint256[] memory a = sample.exampleAllIndexOfString();
        assertEq(a.length, 3);
    }

    function testSplitByNumber() public {
        string[][] memory a = sample.exampleSplitByNumber();
        assertEq(a[0][1], "text");
    }

    function testSplitByDataA() public {
        string[][] memory a = sample.exampleSplitByDataA();
        assertEq(a[1][2], "bo");
    }

    function testSplitByDataC() public {
        string[][] memory a = sample.exampleSplitByDataC();
        assertEq(a[1][2], "bo");
    }

    function testReverseArray() public {
        string[] memory a = sample.exampleReverseArray();
        assertEq(a[0], "bo");
    }

    function testAbArray() public {
        string[] memory a = sample.exampleArrayAb();
        assertEq(a[2], "mik");
    }

    function testSubArray() public {
        string[] memory a = sample.exampleSubArray();
        assertEq(a[0], "example");
    }

    function testShiftArray() public {
        (string memory text, string[] memory array) = sample
            .exampleShiftArray();
        assertEq(array.length, 7);
        assertEq(text, "example");
    }

    function testPopArray() public {
        (string memory text, string[] memory array) = sample.examplePopArray();
        assertEq(array.length, 7);
        assertEq(text, "bo");
    }

    function testLengthArray() public {
        uint256 a = sample.exampleLengthArray();
        assertEq(a, 8);
    }

    function testTrimStartArray() public {
        string[] memory a = sample.exampleTrimStartArray();
        assertEq(a.length, 5);
        assertEq(a[0], "pal");
        assertEq(a[1], "text");
        assertEq(a[2], "mik");
        assertEq(a[3], "bo");
        assertEq(a[4], "bo");
    }

    function testTrimEndArray() public {
        string[] memory a = sample.exampleTrimEndArray();
        assertEq(a.length, 4);
        assertEq(a[0], "example");
        assertEq(a[1], "asas");
        assertEq(a[2], "example");
        assertEq(a[3], "pal");
    }

    function testTrimArray() public {
        string[] memory a = sample.exampleTrimArray();
        assertEq(a.length, 4);
        assertEq(a[0], "example");
        assertEq(a[1], "pal");
        assertEq(a[2], "text");
        assertEq(a[3], "mik");
    }
}
