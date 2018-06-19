# 4. Input and Output [Haskell]

Write a **stand-alone** program that complies to the following specification.
The program should read two lines from the standard input. The first line is a space-separated list of integers.
The second line contains a number of spaces followed by a caret `^` that points to a number on the previous line.
An example of this is as follows:
```
5 3 8 10 6 2
       ^
```
In this case, the caret points to the number `10`. The output of your program is a single integer `n` that is computed as follows:
Let `l` be the list of numbers on the first line. Let `m` be the number that is pointed to by the caret.
Now `n` is the sum of the `m` numbers in `l` that come directly after `m` when we view `l` as a cyclic list.

In the example above, we have `m = 10`. Therefore, `n` is equal to the sum of the 10 numbers directly after `m`:

```n = 6 + 2 + 5 + 3 + 8 + 10 + 6 + 2 + 5 + 3 = 50```

You may assume that the input is always valid.
Hence, you may assume that the numbers in the list are only separated by one space, and that the caret always points at a number.
However, if a number is more than one digit long, the caret can point at any digit of this number.

## Examples
```
1 2 3 4 5
    ^
10
```
```
5 3 8 10 6 2
       ^
50
```
```
8 54 28 101 6
         ^
3946
```
```
8 54 28 101 6
        ^
3946
```
```
main
695 492 825 809 306 6 161 463 558 554 916 390 19 46 9 697 546 757 3 941
                                            ^
178872
