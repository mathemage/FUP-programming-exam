# 1. Count Valid Matching of Parentheses [Scheme]

Count number of valid ways to arrange **n** pairs of parentheses.

### Valid Matching of Parentheses

Let a string **s** contain only 2 types of characters:
* an **opening parenthesis** `(`
* a **closing parenthesis** `)`

A prefix of **s** is any initial segment **s[0]s[1]...s[k]** of string **s**, where **0 <= k < length(s)**.

Parentheses in a string **s** are **validly matched** if and only if
*every prefix of **s** has the count of opening parentheses `(` greater or equal to the count of closing parentheses `)`*.

### Implementation in Scheme

In Scheme, implement a function
```scheme
(f n)
``` 
For a given integer **n >= 0**, `(f n)` returns *the total number of possible ways to validly match **n** pairs of parentheses*.

## Examples
For `0`, `1`, `2`, `10`, `20` and `40` the corresponding values of `f(n)` are:
```
> (map rbt '(0 1 2 10 20 40))
(1 2 3 144 17711 267914296)
```

## Hints

Any solution is okay, even the very inefficient one.
There are several ways how to solve this problem and we are not forcing you into any specific.
Should you feel especially in need of hints, you may find some ideas to some approaches below.

Keep in mind there may be alternative solutions to this and we are not pushing you into any specific implementation. 
We will test for **n <= 17** so as long as your solution can manage `(f 17)`, it's efficient enough for this exam.

### Approach 1: recursive calculation
* Notice that every valid matching must start with an opening parenthesis `(`.
* This opening parenthesis must have its corresponding closing parenthesis `)`.
* Thus, any valid matching **s** of **n** parentheses is of the form **"( s1 ) s2"** for some substrings **s1** and **s2**.

From these hints, you can come up with a recursive formula for `(f n)`.

### Approach 2: dynamic programming
* Consider function
`(contains as bs)`
that answers how many valid strings there are with `as` opening parenthesis and `bs` closing parenthesis.
* Think about how to recursively use such information to build up the final result.
* Even this solution might appear too slow. But as long as it works for `(f 17)`, it's okay for now...

### Approach 3: combinatorial formula
* There is a combinatorial formula expressing this quantity.
It allows for (almost) immediate calculation of the result.
* So if you know what **Catalan numbers** are, you can achieve (almost) constant time complexity.
* Or you can figure out the formula directly during this exam.
