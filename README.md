# Arrays Utils Library for Solidity

# About
This is a comprehensive arrays utils library for processing and programmatically working with arrays of primitive data. This library is focused on making the use of arrays more user-friendly, or programmer friendly.

The gas cost for implementing various operations would definitely defer, depending on the size and length of the array being processed. For large arrays, pre-processing is advised, so as to reduce the gas cost. Operations like splitByDataInclusive, consumes much more gas than other operations, and is advised to be used wisely, preferably on smaller arrays.

All functions are written with simplicity in mind, and should be easy to use and implement, please feel free to make any request or update for request to me, it's still a work in progress, and this contribution is important to the Web3 Community. Code Away  


# Getting started
install this library by running this on your terminal
```foundry
forge install OsoTega/array-utils-lib --no-commit
```

# Examples
## Importing to Project
import the type of array library you need for your project at the top of the contract you want to use it in
```solidity
//importing the string array library
import {StringsArrayUtilsLib} from "array-utils-lib/array-utils/StringsArrayUtilsLib.sol"

contract UseContract{
    using StringsArrayUtilsLib for string[];

    //...
}
```

## Splitting an array
There are three functions from the library that can help you achieve this split, the splitByNumber, splitByDataInclusive and splitByDataExclusive functions returns a two dimensional string array of all the splitted parts. The splitByNumber splits the array into pairs of array with the number length, the splitByDataInclusive returns an array of the array splitted by the found data, including the found data. The splitByDataExclusive does what the splitByDataInclusive does, without including the data. The functions takes in two arguements (besides the array),
1. The array by which the splitting is done,
2. a number to split the array by (splitByNumber) or the data to split the array by (splitByDataInclusive); 

```solidity
//String array example splitByNumber
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

//expected result is [[example, text], [example, pal], [example, mik], [bo, bo]];

//String array example splitByDataInclusive
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

//expected result is [[example, asas, example, pal, text], [mik, bo, bo]];

//String array example splitByDataExclusive
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

//expected result is [[example, asas, example, pal], [mik, bo, bo]];
```


## The length of an array
The length function returns the length of an array

```solidity
array[0] = "example";
array[1] = "asas";
array[2] = "example";
array[3] = "pal";
array[4] = "text";
array[5] = "mik";
array[6] = "bo";
array[7] = "bo";
uint256 newtext = array.lengthArray();

//expected result is 8
```


## Checking if an array contains a data
The includes function from the library returns a bool if the data searched for is found inside the array searched . The function takes in an arguement (besides the array),
1. The data searched for,

```solidity
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "abnc";
array[3] = "pal";
array[4] = "pap";
array[5] = "mik";
array[6] = "bo";
bool newtext = array.includes("example");

//expected result is true
```

## Checking if an array is a sub array of another array 
The isSubArray function from the library returns a bool if the array searched for is found inside the array searched . The function takes in an arguement (besides the array),
1. The array searched for,

```solidity
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

//expected result is true
```

## Compare arrays
The compareArray function from the library returns a bool if the argument array is equal to the array. The functions takes in an arguement (besides the array),
1. The array to compare,

```solidity
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

//expected result is true
```

## Replacing a data in an array
The replaceOne function from the library returns a new array with the replaced data. The function replaces the first occurrence of the data to replace. The function takes in two arguements (besides the array),
1. The data to look out for,
2. The data to replace the one being looked out for

```solidity
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "example";
array[3] = "pal";
array[4] = "example";
array[5] = "mik";
array[6] = "bo";

return array.replaceOne("example", "ab");

//expected result is [ab, text, example, pal, example, mik, bo]
```

## Replacing all occurrence of a data in an array
The replaceAll function from the library returns a new array with the replaced data. The function replaces all occurrence of the data to replace. The function takes in two arguements (besides the array),
1. The data to look out for,
2. The data to replace the one being looked out for

```solidity
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "example";
array[3] = "pal";
array[4] = "example";
array[5] = "mik";
array[6] = "bo";

return array.replaceOne("example", "ab");

//expected result is [ab, text, ab, pal, ab, mik, bo]
```

## join an array to another array
The join function handles this operation. The function joins a given array argument with the array, and returns a new array with the two arrays joined. The function takes in an arguement(besides the array),
1. The array to join,

```solidity
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

//expected result is [example, text, abnc, pal, pap, mik, bo, example, text, abnc, pal, pap, mik, bo]
```

## data at an index
The dataAt function retrieves a data at an index. The function takes in an arguement.

1. The index

```solidity
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "example";
array[3] = "pal";
array[4] = "example";
array[5] = "mik";
array[6] = "bo";

return array.dataAt(4);

//expected result is example
```

## The index of a data
The indexOf function retrieves the index of a data. The function takes in an arguement.

1. The data

```solidity
//index of
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "example";
array[3] = "pal";
array[4] = "example";
array[5] = "mik";
array[6] = "bo";

return array.indexOf("pal");

//expected result is 3

//last index of
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "example";
array[3] = "pal";
array[4] = "example";
array[5] = "mik";
array[6] = "bo";

return array.lastIndexOf("example");

//expected result is 4
```

## All the indexes of a data
The allIndexOf function retrieves all the indexes of a data. The function takes in an arguement and returns a uint256 array of all the indexes.

1. The data

```solidity
string[] memory array = new string[](7);
array[0] = "example";
array[1] = "text";
array[2] = "example";
array[3] = "pal";
array[4] = "example";
array[5] = "mik";
array[6] = "bo";

return array.allIndexOf("example");

//expected result is [0,2,4]
```

## Slicing an array or creating a sub array
The slice and subArray functions from the library returns a new array with the sliced and subArray. The slice function returns a new array without the specified start and end indexes, and the subArray function returns a new array from the start to the end index. The functions takes in two arguements (besides the array),
1. The start index,
2. The end index

```solidity
//Slice

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

//expected result is [example, asas, mik, bo, bo];

//SubArray

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

//expected result is [example, pal, text]
```

## Reversing an array
The reverse function reverses the array and returns a new reversed array.

```solidity
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

//expected result is [bo, bo, mik, text, pal, example, asas, example]
```

## Shifting an array
The shift function shifts the array and returns the data at the first index, and new array
without the first index.

```solidity
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

//expected result is (example, [asas, example, pal, text, mik, bo, bo])
```

## Pop an array
The pop function pops the array and returns the data at the last index, and new array
without the last index.

```solidity
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

//expected result is (bo, [example, asas, example, pal, text, mik, bo])
```


## Requirements
The contract was written using solidity ^0.8.18

