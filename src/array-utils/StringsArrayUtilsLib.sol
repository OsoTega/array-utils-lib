//SPDX-License-Identifier: MIT

/*
 * @title Array Utils Library for Solidity contracts.
 * @author Tega Osowa <https://tega-osowa-portfolio.netlify.app/>
 *
 * @dev This is a comprehensive array utils library for processing and programmatically
 *      working with arrays. This library is focused on making the use of arrays more
 *      user-friendly, or programmer friendly.
 *
 *      The gas cost for implementing various operations would definitely defer,
 *      depending on the size and length of the array being processed. For large arrays,
 *      pre-processing is advised, so as to reduce the gas cost. Operations like splitByDataInclusive
 *      consumes much more gas than other operations, and is
 *      advised to be used wisely, preferably on smaller arrays.
 *      All functions are written with simplicity in mind, and should be easy to use and
 *      implement, please feel free to make any request or update for request to me,
 *      it's still a work in progress, and this contribution is important to the Web3 Community.
 *      Code Away
 */

pragma solidity ^0.8.18;

library StringsArrayUtilsLib {
    /*
     * @dev Returns a bool stating true if the data is included in the array.
     * @param array The array to check.
     * @param check The data to search for.
     * @return A bool which is true if the data is in the array.
     */
    function includes(
        string[] memory array,
        string memory check
    ) internal pure returns (bool) {
        bool isInclude = false;
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(check))
            ) {
                isInclude = true;
            }
        }
        return isInclude;
    }

    /*
     * @dev Compares two arrays.
     * @param array The array to split.
     * @param arrayCheck The array to compare.
     * @return A bool if the arrays are thesame.
     */
    function compareArray(
        string[] memory array,
        string[] memory arrayCheck
    ) internal pure returns (bool) {
        bool compare = true;
        if (array.length != arrayCheck.length) {
            compare = false;
        } else {
            for (uint256 i = 0; i < array.length; i++) {
                if (
                    keccak256(abi.encodePacked(array[i])) !=
                    keccak256(abi.encodePacked(arrayCheck[i]))
                ) {
                    compare = false;
                }
            }
        }
        return compare;
    }

    /*
     * @dev Checks if an array is a sub array of the array.
     * @param array The array to split.
     * @param check The array to check.
     * @return A bool if the array is a sub array.
     */
    function isSubArray(
        string[] memory array,
        string[] memory check
    ) internal pure returns (bool) {
        bool exist = false;
        for (uint256 i = 0; i < array.length; i++) {
            string[] memory findArray = new string[](check.length);
            uint256 count = 0;
            for (
                uint256 a = i;
                a <
                (
                    (i + check.length) > array.length
                        ? array.length
                        : (i + check.length)
                );
                a++
            ) {
                findArray[count] = array[a];
                count++;
            }
            if (compareArray(check, findArray)) {
                exist = true;
                break;
            }
        }
        return exist;
    }

    /*
     * @dev Joins two arrays together.
     * @param array The array to split.
     * @param joiner The array to join.
     * @return A new array with both array data.
     */
    function join(
        string[] memory array,
        string[] memory joiner
    ) internal pure returns (string[] memory) {
        string[] memory newStringArray = new string[](
            array.length + joiner.length
        );
        uint256 count = 0;
        for (uint256 i = 0; i < array.length; i++) {
            newStringArray[count] = array[i];
            count++;
        }

        for (uint256 i = 0; i < joiner.length; i++) {
            newStringArray[count] = joiner[i];
            count++;
        }
        count = 0;
        return newStringArray;
    }

    /*
     * @dev Repalces the first occurance of a data in the array.
     * @param array The array to split.
     * @param replace The data to check for.
     * @param newtext The data to replace with.
     * @return A new array with the replaced data.
     */
    function replaceOne(
        string[] memory array,
        string memory replace,
        string memory newtext
    ) internal pure returns (string[] memory) {
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(replace))
            ) {
                array[i] = newtext;
                break;
            }
        }
        return array;
    }

    /*
     * @dev Repalces the all occurance of a data in the array.
     * @param array The array to split.
     * @param replace The data to check for.
     * @param newtext The data to replace with.
     * @return A new array with the replaced data.
     */
    function replaceAll(
        string[] memory array,
        string memory replace,
        string memory newtext
    ) internal pure returns (string[] memory) {
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(replace))
            ) {
                array[i] = newtext;
            }
        }
        return array;
    }

    /*
     * @dev Retrieves the data at an index in the array.
     * @param array The array to retrieve from.
     * @param index The data to retrieve.
     * @return The data.
     */
    function dataAt(
        string[] memory array,
        uint256 index
    ) internal pure returns (string memory) {
        return array[index];
    }

    /*
     * @dev Retrieves the index of a data in the array.
     * @param array The array to retrieve from.
     * @param data The data to retrieve index.
     * @return The index.
     */
    function indexOf(
        string[] memory array,
        string memory char
    ) internal pure returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(char))
            ) {
                count = i;
                break;
            }
        }
        return count;
    }

    /*
     * @dev Retrieves the last index of a data in the array.
     * @param array The array to retrieve from.
     * @param data The data to retrieve index.
     * @return The index.
     */
    function lastIndexOf(
        string[] memory array,
        string memory char
    ) internal pure returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(char))
            ) {
                count = i;
            }
        }
        return count;
    }

    /*
     * @dev Returns a two dimensional array containing the splitted arrays.
     * @param array The array to split.
     * @param number The number to split by.
     * @return A two dimensional array.
     */
    function splitByNumber(
        string[] memory array,
        uint256 number
    ) internal pure returns (string[][] memory) {
        uint256 remainder = array.length % number;
        uint256 division = array.length / number;
        string[][] memory newArray = new string[][](
            division + (remainder > 0 ? 1 : 0)
        );

        uint256 start = 0;
        uint256 end = number;

        for (uint256 i = 0; i < division; i++) {
            string[] memory nc = new string[](number);
            uint256 count = 0;
            for (uint256 a = start; a < end; a++) {
                nc[count] = array[a];
                count++;
            }
            newArray[i] = nc;
            start += number;
            end += number;
        }

        if (remainder > 0) {
            string[] memory nc = new string[](remainder);
            uint256 count = 0;
            for (uint256 i = start; i < array.length; i++) {
                nc[count] = array[i];
                count++;
            }
            newArray[newArray.length - 1] = nc;
        }

        return newArray;
    }

    /*
     * @dev Returns a two dimensional array containing the splitted arrays.
     * @param array The array to split.
     * @param number The data to split by.
     * @return A two dimensional array.
     */
    function splitByDataInclusive(
        string[] memory array,
        string memory text
    ) internal pure returns (string[][] memory) {
        string[][] memory newArray = new string[][](array.length);
        uint256 count = 0;
        uint256 visiblePoint = 0;
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(text))
            ) {
                string[] memory nc = new string[]((i + 1) - count);

                uint256 start = 0;
                for (
                    uint256 a = count;
                    a < ((i + 1) > array.length ? array.length : (i + 1));
                    a++
                ) {
                    nc[start] = array[a];
                    start++;
                }
                count = i;
                newArray[visiblePoint] = nc;
                visiblePoint++;
            }
        }

        string[] memory nca = new string[]((array.length - 1) - count);

        uint256 starta = 0;
        for (uint256 a = count + 1; a < array.length; a++) {
            nca[starta] = array[a];
            starta++;
        }

        newArray[visiblePoint] = nca;
        visiblePoint++;

        string[][] memory n_array = new string[][](visiblePoint);

        for (uint256 a = 0; a < (visiblePoint); a++) {
            n_array[a] = newArray[a];
        }
        newArray = new string[][](0);
        return n_array.length > 1 ? n_array : new string[][](0);
    }

    /*
     * @dev Returns a two dimensional array containing the splitted arrays.
     * @param array The array to split.
     * @param number The data to split by.
     * @return A two dimensional array.
     */
    function splitByDataExclusive(
        string[] memory array,
        string memory text
    ) internal pure returns (string[][] memory) {
        string[][] memory newArray = new string[][](array.length);
        uint256 count = 0;
        uint256 visiblePoint = 0;
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(text))
            ) {
                string[] memory nc = new string[](i - count);

                uint256 start = 0;
                for (uint256 a = count; a < i; a++) {
                    nc[start] = array[a];
                    start++;
                }
                count = i;
                newArray[visiblePoint] = nc;
                visiblePoint++;
            }
        }

        string[] memory nca = new string[]((array.length - 1) - count);

        uint256 starta = 0;
        for (uint256 a = count + 1; a < array.length; a++) {
            nca[starta] = array[a];
            starta++;
        }

        newArray[visiblePoint] = nca;
        visiblePoint++;

        string[][] memory n_array = new string[][](visiblePoint);

        for (uint256 a = 0; a < (visiblePoint); a++) {
            n_array[a] = newArray[a];
        }
        newArray = new string[][](0);
        return n_array.length > 1 ? n_array : new string[][](0);
    }

    /*
     * @dev Reverses the array.
     * @param array The array to reverse.
     * @return A new reversed array.
     */
    function reverse(
        string[] memory array
    ) internal pure returns (string[] memory) {
        string[] memory newArray = new string[](array.length);
        uint256 count = 0;
        int256 i = int256(array.length - 1);
        while (i > -1) {
            newArray[count] = array[uint256(i)];
            count++;
            i--;
        }
        return newArray;
    }

    /*
     * @dev Retrieves all the indexs of a data in the array.
     * @param array The array to retrieve from.
     * @param data The data to retrieve index.
     * @return An array of all the indexes.
     */
    function allIndexOf(
        string[] memory array,
        string memory char
    ) internal pure returns (uint256[] memory) {
        uint256[] memory arrayIndex = new uint256[](array.length);
        uint256 visiblePoint = 0;
        for (uint256 i = 0; i < array.length; i++) {
            if (
                keccak256(abi.encodePacked(array[i])) ==
                keccak256(abi.encodePacked(char))
            ) {
                arrayIndex[visiblePoint] = i;
                visiblePoint++;
            }
        }
        uint256[] memory n_array = new uint256[](visiblePoint);

        for (uint256 a = 0; a < (visiblePoint); a++) {
            n_array[a] = arrayIndex[a];
        }
        arrayIndex = new uint256[](0);
        return n_array.length > 1 ? n_array : new uint256[](0);
    }

    /*
     * @dev Removes a subset from the array.
     * @param array The array to remove a subset.
     * @param start the start of the subset.
     * @param end the end of the subset.
     * @return A new array without the subset.
     */
    function slice(
        string[] memory array,
        uint256 start,
        uint256 end
    ) internal pure returns (string[] memory) {
        string[] memory newArray = new string[](
            array.length - ((end + 1) - start)
        );
        uint256 count = 0;
        for (uint256 a = 0; a < start; a++) {
            newArray[count] = array[a];
            count++;
        }
        for (uint256 a = end + 1; a < array.length; a++) {
            newArray[count] = array[a];
            count++;
        }
        return newArray;
    }

    /*
     * @dev Removes unnecesary space from the start of the array.
     * @param array The array to trim.
     * @return A new array which is trimmed at the start.
     */
    function trimStart(
        string[] memory array
    ) internal pure returns (string[] memory) {
        uint256 i = 0;
        uint256 count = 0;
        while (i < array.length) {
            if (
                keccak256(abi.encodePacked(array[i])) !=
                keccak256(abi.encodePacked(""))
            ) {
                count = i;
                break;
            }
            i++;
        }
        string[] memory trimmedArray = subArray(array, count, array.length - 1);
        return trimmedArray;
    }

    /*
     * @dev Removes unnecesary space from the end of the array.
     * @param array The array to trim.
     * @return A new array which is trimmed at the end.
     */
    function trimEnd(
        string[] memory array
    ) internal pure returns (string[] memory) {
        uint256 i = array.length - 1;
        uint256 count = 0;
        while (i >= 0) {
            if (
                keccak256(abi.encodePacked(array[i])) !=
                keccak256(abi.encodePacked(""))
            ) {
                count = i;
                break;
            }
            i--;
        }
        string[] memory trimmedArray = subArray(array, 0, count);
        return trimmedArray;
    }

    /*
     * @dev Removes unnecesary space from the start and end of the array.
     * @param array The array to trim.
     * @return A new array which is trimmed at the start and end.
     */
    function trim(
        string[] memory array
    ) internal pure returns (string[] memory) {
        string[] memory startTrim = trimStart(array);
        string[] memory trimmedArray = trimEnd(startTrim);
        return trimmedArray;
    }

    /*
     * @dev Creates a sub array from the array.
     * @param array The array to create a new array.
     * @param start the start of the sub array.
     * @param end the end of the sub array.
     * @return A new array from the sub array.
     */
    function subArray(
        string[] memory array,
        uint256 start,
        uint256 end
    ) internal pure returns (string[] memory) {
        string[] memory newArray = new string[]((end + 1) - start);
        uint256 count = 0;
        for (uint256 a = start; a < (end + 1); a++) {
            newArray[count] = array[a];
            count++;
        }
        return newArray;
    }

    /*
     * @dev Shifts the array retrieves and removes the first element from the array.
     * @param array The array to shift.
     * @return Two data, a new array without the first element, and the first element.
     */
    function shift(
        string[] memory array
    ) internal pure returns (string memory, string[] memory) {
        string[] memory newArray = new string[](array.length - 1);
        for (uint256 a = 0; a < newArray.length; a++) {
            newArray[a] = array[a + 1];
        }
        string memory returnText = array[0];
        return (returnText, newArray);
    }

    /*
     * @dev Pops the array retrieves and removes the last element from the array.
     * @param array The array to pop.
     * @return Two data, a new array without the last element, and the last element.
     */
    function pop(
        string[] memory array
    ) internal pure returns (string memory, string[] memory) {
        string[] memory newArray = new string[](array.length - 1);
        for (uint256 a = 0; a < newArray.length; a++) {
            newArray[a] = array[a];
        }
        string memory returnText = array[array.length - 1];
        return (returnText, newArray);
    }

    /*
     * @dev Gets the length of the array.
     * @param array The array to get length.
     * @return The length of the array.
     */
    function lengthArray(
        string[] memory array
    ) internal pure returns (uint256) {
        return array.length;
    }
}
