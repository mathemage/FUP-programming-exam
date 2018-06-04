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
harmonic
```
Output:
```
1.9200000000000004
```

#### Example 2
Input:
```
1 2 3 4
geometric
```
Output:
```
2.213363839400643
```
