# 4. Means [Haskell]

Write a simple **stand-alone** program that computes various types of mathematical **means** (i.e. averages) of given numbers.
It will read a line of **space-separated** real numbers from the standard input and return 6 kinds of means:

* **minMean** as the minimum of numbers
* **maxMean** as the maximum of numbers
* **arithmeticMean** as the (standard) *arithmetic mean* (also called *average*):

    ![arithmetic mean](arithmeticMean.svg)
    
* **geometricMean** as the *geometric mean*:

    ![geometric mean](geometricMean.svg)
    
* **quadraticMean** as the *quadratic mean* (also called *root mean square* or *rms*):

    ![quadratic mean](quadraticMean.svg)
    
* **harmonicMean** as the *harmonic mean* (also called *subcontrary mean*):

    ![harmonic mean](harmonicMean.svg)
    
Preferably, implement following functions to make your stand-alone Haskell program work:

```haskell
minMean :: [Double] -> Double
maxMean :: [Double] -> Double
arithmeticMean :: [Double] -> Double
geometricMean :: [Double] -> Double
quadraticMean :: [Double] -> Double
harmonicMean :: [Double] -> Double
```

Moreover, it could be useful to implement a parsing function:

```haskell
stringToDoubles :: String -> [Double]
```

## Input
A single line is read from the standard input containing real numbers separated by spaces.

## Output
The first line displays the list of input numbers (parsed into `[Double]`).

The second line displays `minMean == ` and the computed minimum.

The third line displays `harmonicMean == ` and the computed harmonic mean.

The fourth line displays `geometricMean == ` and the computed geometric mean.

The fifth line displays `arithmeticMean == ` and the computed arithmetic mean.

The sixth line displays `quadraticMean == ` and the computed quadratic mean.

The last line displays `maxMean == ` and the computed maximum.

## Examples

### Example 1
input:
```
1 2 3 4 5
```
output:
```
[1.0,2.0,3.0,4.0,5.0]
"minMean == 1.0"
"harmonicMean == 2.18978102189781"
"geometricMean == 2.605171084697352"
"arithmeticMean == 3.0"
"quadraticMean == 3.3166247903554"
"maxMean == 5.0"
```

## Note
The queries in the example are following:

substrings "a" and "a" are isomorphic: f(a) = a;
substrings "ab" and "ca" are isomorphic: f(a) = c, f(b) = a;
substrings "bac" and "aba" are not isomorphic since f(b) and f(c) must be equal to a at same time;
substrings "bac" and "cab" are isomorphic: f(b) = c, f(a) = a, f(c) = b.