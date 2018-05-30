# 4. Means [Haskell]

Write a simple **stand-alone** program that computes various types of mathematical **means** (i.e. averages) of given numbers.
It will read a line of **space-separated** real numbers from the standard input and return 4 kinds of means/averages:

* **harmonicMean** as the *harmonic mean* (also called *subcontrary mean*):

    ![harmonic mean](harmonicMean.svg)
    
* **geometricMean** as the *geometric mean*:

    ![geometric mean](geometricMean.svg)
    
* **arithmeticMean** as the (standard) *arithmetic mean* (also called *average*):

    ![arithmetic mean](arithmeticMean.svg)
    
* **quadraticMean** as the *quadratic mean* (also called *root mean square* or *rms*):

    ![quadratic mean](quadraticMean.svg)
    
Preferably, implement following functions to make your stand-alone Haskell program work:

```haskell
harmonicMean :: [Double] -> Double
geometricMean :: [Double] -> Double
arithmeticMean :: [Double] -> Double
quadraticMean :: [Double] -> Double
```

Moreover, it could be useful to implement a parsing function:

```haskell
stringToDoubles :: String -> [Double]
```

## Hints
Keep in mind that there are many useful functions in the `Prelude` of Haskell,
e.g. `map`, `words`, `fromIntegral`, `sum`, `product`, `**`, `read`, `show`, `.`, `$` etc.
They may help you write the solution as fast as possible.

## Input
A single line is read from the standard input containing real numbers (possibly with the *minus* signs and *decimal points*).
The numbers are separated by spaces.

You may assume that the user-given input is **always valid**.
In particular, at least one number will be always entered.

## Output
The first line displays the list of input numbers (parsed into `[Double]`).

The second line displays `harmonicMean == ` and the computed harmonic mean.

The third line displays `geometricMean == ` and the computed geometric mean.

The fourth line displays `arithmeticMean == ` and the computed arithmetic mean.

The fifth line displays `quadraticMean == ` and the computed quadratic mean.

**Please surround the second, third, fourth and fifth line by "double quotes".**

## Examples

### Example 1
input:
```
1
```
output:
```
[1.0]
"minMean == 1.0"
"harmonicMean == 1.0"
"geometricMean == 1.0"
"arithmeticMean == 1.0"
"quadraticMean == 1.0"
"maxMean == 1.0"
```

### Example 2
input:
```
1 2 3 4
```
output:
```
[1.0,2.0,3.0,4.0]
"minMean == 1.0"
"harmonicMean == 1.9200000000000004"
"geometricMean == 2.213363839400643"
"arithmeticMean == 2.5"
"quadraticMean == 2.7386127875258306"
"maxMean == 4.0"
```

### Example 3
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

### Example 4
input:
```
1 2 39.3 2 3 -12 3.1415 -3.1415
```
output:
```
[1.0,2.0,39.3,2.0,3.0,-12.0,3.1415,-3.1415]
"minMean == -12.0"
"harmonicMean == 3.5157953592395867"
"geometricMean == 3.920835722212454"
"arithmeticMean == 4.4125"
"quadraticMean == 14.689401130151628"
"maxMean == 39.3"
```
