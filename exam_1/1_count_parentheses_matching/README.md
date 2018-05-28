# 1. Count Valid Matching of Parentheses [Scheme]

Count number of valid ways to arrange **n** pairs of parentheses.

### Valid Matching of Parentheses

Let a string **s** contain only 2 types of characters:
* an **opening parenthesis** `(`
* a **closing parenthesis** `)`

A prefix of **s** is any initial segment **s[0:k]** of string **s**, where **0 <= k < length(s)**.

Parentheses in a string **s** are **validly matched** if and only if
*every prefix of **s** has the count of opening parentheses `(` greater or equal to the count of closing parentheses `)`*.

### Implementation in Scheme

In Scheme, implement a function
```scheme
(f n)
``` 
For a given integer **n >= 0**, `(f n)` returns *the total number of possible ways to validly match **n** pairs of parentheses*.

## Examples
For `0`, `1`, `2`, `5` and `17` the corresponding values of `f(n)` are:
```
> (map f '(0 1 2 5 17))
(1 1 2 42 129644790)
```

## Note
