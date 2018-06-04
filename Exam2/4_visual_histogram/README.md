# 4. Visual Histogram [Haskell]

Write a simple **stand-alone** program that "visually displays" a histogram of given numbers.
It should read a line of **space-separated** real numbers and a line of a single integer (the number of bins) from the standard input.
It should print a *visual histogram* to the standard output.

**TODO remove below**

Preferably, implement following functions to make your stand-alone Haskell program work:

```haskell
harmonicMean :: [Double] -> Double
geometricMean :: [Double] -> Double
arithmeticMean :: [Double] -> Double
quadraticMean :: [Double] -> Double
```
In your program, use the following function `mean`:
```haskell
mean :: String -> [Double] -> Double
mean variant
  | variant == "harmonic"   = harmonicMean
  | variant == "geometric"  = geometricMean
  | variant == "arithmetic" = arithmeticMean
  | variant == "quadratic"  = quadraticMean
```
It generates the variant of a mean function based on the parameter `variant`.

Use this function to implement:
```haskell
printMean :: String -> String -> IO ()
```
which prints the result of a mean, given:
* a `String` parameter for the variant of the mean -- see the cases in `mean` implementation
* a `String` of real numbers to be used as values from which to compute the mean

## Hints
Keep in mind that there are many useful functions in the `Prelude` of Haskell,
e.g. `map`, `words`, `fromIntegral`, `sum`, `product`, `**`, `read`, `show`, `.`, `$` etc.
They may help you write the solution as fast as possible.

Moreover, it could be also useful to implement a parsing function:
```haskell
stringToDoubles :: String -> [Double]
```

## Input
Two lines are read from the standard input:
* the first line contains **space-separated** real numbers (possibly with the *minus* signs and *decimal points*).
* the second line contains a single word, namely one of the four available variants of the mean:
    * `"harmonic"`
    * `"geometric"`
    * `"arithmetic"`
    * `"quadratic"`

You may assume that the user-given input is **always valid**.
In particular, at least one number will be always entered, and the second line always contain only one of the four variants.

## Output
The first (and the only) line of the output displays the result of `printMean` with:
* the variant set by the second line of the input
* the values of numbers set by the first line of the input

## Examples

#### Example 1
Input:
```
1 2 3 4
3
```
Output:
```
:|
:|
:||
```
___

Input:
```
1 2 3 4
6
```
Output:
```
:|
:
:|
:
:|
:|
```

#### Example 2
Input:
```
-3.14 -3 -2 -1 0 1 2 3 3.14
4
```
Output:
```
:|||
:|
:||
:|||
```
___
Input:
```
-3.14 -3 -2 -1 0 1 2 3 3.14
8
```
Output:
```
:||
:|
:|
:
:|
:|
:|
:||
```

#### Example 3
Input:
```
4 10 5 -2 5 9 -8 -12 -2 10 -8 4 4 -5 -8 7 11 -4 -8 -20 20 -2 -22 11 7 7 20 -15 9 -6 -12 4 -9 8 11 8 8 -11 -7 13 6 2 -12 -7 -9 21 -9 4 -8 19 -8 9 9 2 -4 13 16 6 12 -8 5 -8 -1 8 -2 -29 20 -18 -5 10 1 -12 -4 11 -8 -2 17 8 -13 3 3 -10 10 3 -8 13 -4 -12 -15 -4 8 -6 8 -6 0 -5 10 13 -16 -13 -1 -2 14 -2 -2 -23 8 -3 -13 15 -25 18 -5 -2 -11 -8 4 -8 3 1 -6 -7 11 8 -1 -8 -7 1 23 -8 -12 -12 13 2 -1 0 21 -11 9 -10 -8 5 -1 1 -5 8 -8 1 2 -3 11 -16 6 -6 -1 4 -1 10 0 -11 -12 -11 8 6 6 -19 5 6 -3 0 6 11 16 6 -5 3 3 12 13 15 -4 -6 5 -1 4 4 20 15 -13 -1 -11 4 8 -7 -8 2 5 -8 -2 -6 -4 8 -6 -7 2 15 -14 -2 -12 -2 5 4 -9 2 -6 6 13 16 -5 -7 21 9 2 15 -2 -9 0 18 21 -9 2 14 14 -2 6 3 1 14 5 12 20 1 2 4 9 -18 2 -2 19 7 -21 7 -8 11 -7 6 -9 -11 11 -16 -35 -3 3 -16 8 0 11 3 5 -10 5 0 9 3 -13 -5 2 1 -5 -6 -4 -10 -1 -8 0 6 5 -4 -5 16 -4 -10 1 11 0 -8 7 12 6 -3 2 -15 1 -12 -14 -12 15 9 7 -3 6 27 -19 4 6 -19 0 -8 9 21 -2 -10 -8 -1 3 1 -8 1 5 -15 5 -4 -11 -6 -1 8 6 -5 -9 3 0 22 4 3 5 1 -4 -3 -7 18 0 30 15 1 1 -1 -11 -5 8 12 -1 -15 -10 -4 6 -17 -9 -1 -5 -14 9 -20 11 0 -10 19 14 17 22 3 0 -1 2 -2 4 -7 -12 0 -6 18 -4 1 30 -17 -27 23 5 0 3 -15
10
```
Output:
```
:||
:|||
:|||||||||||||||
:|||||||||||||||||||||||||||||||||||||||||||
:|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
:||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
:||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
:||||||||||||||||||||||||||||||||||||||||
:|||||||||||||||||||||||
:|||
```
___
Input:
```
4 10 5 -2 5 9 -8 -12 -2 10 -8 4 4 -5 -8 7 11 -4 -8 -20 20 -2 -22 11 7 7 20 -15 9 -6 -12 4 -9 8 11 8 8 -11 -7 13 6 2 -12 -7 -9 21 -9 4 -8 19 -8 9 9 2 -4 13 16 6 12 -8 5 -8 -1 8 -2 -29 20 -18 -5 10 1 -12 -4 11 -8 -2 17 8 -13 3 3 -10 10 3 -8 13 -4 -12 -15 -4 8 -6 8 -6 0 -5 10 13 -16 -13 -1 -2 14 -2 -2 -23 8 -3 -13 15 -25 18 -5 -2 -11 -8 4 -8 3 1 -6 -7 11 8 -1 -8 -7 1 23 -8 -12 -12 13 2 -1 0 21 -11 9 -10 -8 5 -1 1 -5 8 -8 1 2 -3 11 -16 6 -6 -1 4 -1 10 0 -11 -12 -11 8 6 6 -19 5 6 -3 0 6 11 16 6 -5 3 3 12 13 15 -4 -6 5 -1 4 4 20 15 -13 -1 -11 4 8 -7 -8 2 5 -8 -2 -6 -4 8 -6 -7 2 15 -14 -2 -12 -2 5 4 -9 2 -6 6 13 16 -5 -7 21 9 2 15 -2 -9 0 18 21 -9 2 14 14 -2 6 3 1 14 5 12 20 1 2 4 9 -18 2 -2 19 7 -21 7 -8 11 -7 6 -9 -11 11 -16 -35 -3 3 -16 8 0 11 3 5 -10 5 0 9 3 -13 -5 2 1 -5 -6 -4 -10 -1 -8 0 6 5 -4 -5 16 -4 -10 1 11 0 -8 7 12 6 -3 2 -15 1 -12 -14 -12 15 9 7 -3 6 27 -19 4 6 -19 0 -8 9 21 -2 -10 -8 -1 3 1 -8 1 5 -15 5 -4 -11 -6 -1 8 6 -5 -9 3 0 22 4 3 5 1 -4 -3 -7 18 0 30 15 1 1 -1 -11 -5 8 12 -1 -15 -10 -4 6 -17 -9 -1 -5 -14 9 -20 11 0 -10 19 14 17 22 3 0 -1 2 -2 4 -7 -12 0 -6 18 -4 1 30 -17 -27 23 5 0 3 -15
20
```
Output:
```
:|
:|
:|
:||
:|||||||
:||||||||
:||||||||||||||
:|||||||||||||||||||||||||||||
:|||||||||||||||||||||||||||||||||||||||||||||||||||||||
:||||||||||||||||||||||||||||||||||
:|||||||||||||||||||||||||||||||||||||||||||||||||
:|||||||||||||||||||||||||||||||||||||||||||||
:|||||||||||||||||||||||||||||||||||||||||||||||||||||||
:|||||||||||||||||||||||||||||||||
:||||||||||||||||||||||||
:||||||||||||||||
:||||||||||||||
:|||||||||
:
:|||
```

#### Example 4
Input:
```
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997
10
```
Output:
```
:||||||||||||||||||||||||||
:||||||||||||||||||||
:||||||||||||||||
:||||||||||||||||
:|||||||||||||||||
:|||||||||||||
:|||||||||||||||||
:||||||||||||||
:|||||||||||||||
:||||||||||||||
```
___
Input:
```
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997
20
```
Output:
```
:|||||||||||||||
:|||||||||||
:||||||||||
:||||||||||
:|||||||
:|||||||||
:||||||||
:||||||||
:|||||||||
:||||||||
:||||||
:|||||||
:||||||||||
:|||||||
:|||||||
:|||||||
:|||||||
:||||||||
:|||||||
:|||||||
```
