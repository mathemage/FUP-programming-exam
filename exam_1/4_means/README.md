# 4. Means [Haskell]

Write a simple **stand-alone** program that computes various types of mathematical **means** (i.e. averages) of given numbers.
It will read a line of **space-separated** real numbers from the standard input and return 4 kinds of means/averages:

* **harmonicMean** as the *harmonic mean* (also called *subcontrary mean*) of **n** numbers **x_1**, ..., **x_n**:

    ![harmonic mean](harmonicMean.svg)
    
* **geometricMean** as the *geometric mean* of **n** numbers **a_1**, ..., **a_n**:

    ![geometric mean](geometricMean.svg)
    
* **arithmeticMean** as the (standard) *arithmetic mean* (also called *average*) of **n** numbers **a_1**, ..., **a_n**:

    ![arithmetic mean](arithmeticMean.svg)
    
* **quadraticMean** as the *quadratic mean* (also called *root mean square* or *rms*) of **n** numbers **x_1**, ..., **x_n**:

    ![quadratic mean](quadraticMean.svg)
    
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

#### Harmonic Means
Input:
```
1 2 3 4
harmonic
```
Output:
```
1.9200000000000004
```
___
Input:
```
1 2 3 4 5
harmonic
```
Output:
```
2.18978102189781
```
___
Input:
```
1 2 39.3 2 3 -12 3.1415 -3.1415
```
Output:
```
3.5157953592395867
```

#### Geometric Means
Input:
```
1 2 3 4
geometric
```
Output:
```
2.213363839400643
```
___
Input:
```
1 2 3 4 5
geometric
```
Output:
```
2.605171084697352
```
___
Input:
```
1 2 39.3 2 3 -12 3.1415 -3.1415
geometric
```
Output:
```
2.605171084697352
```

#### Arithmetic Means

Input:
```
1 2 39.3 2 3 -12 3.1415 -3.1415
arithmetic
```
Output:
```
4.4125
```

#### Quadratic Means

Input:
```
1 2 3 4
quadratic
```
Output:
```
2.7386127875258306
```
___
Input:
```
1 2 3 4 5
quadratic
```
Output:
```
3.3166247903554
```
___
Input:
```
1 2 39.3 2 3 -12 3.1415 -3.1415
quadratic
```
Output:
```
14.689401130151628
```
