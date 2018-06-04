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
