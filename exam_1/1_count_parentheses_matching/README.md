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
For `0`, `1`, `2`, `5` and `17` the corresponding values of `f(n)` are:
```
> (map f '(0 1 2 5 17))
(1 1 2 42 129644790)
```

## Note

Some hints:
* Notice that every valid matching must start with an opening parenthesis `(`.
* This opening parenthesis must have its corresponding closing parenthesis `)`.
* Thus, any valid matching **s** of **n** parentheses is of the form **"( s1 ) s2"** for some substrings **s1** and **s2**.
* Now notice that both **s1** and **s2** must again be valid matchings of parentheses.
Let's say they are valid matchings for **n1** and **n2** pairs of parentheses, respectively.
* Numbers **n1** and **n2** are such that **n1 + n2 = n**.
* There are `(f n1)` ways to create **s1** and `(f n2)` ways to create **s2**.
* Every possible way to create **s1**  can be combined every possible way to create **s2**.
Therefore, all these *combinations* would construct a valid matching of parentheses.

From these hints, you can come up with a recursive formula for `(f n)`.
Any solution is okay, even the very inefficient one.
We will test for **n <= 17** so if your solution can manage `(f 17)`, it's efficient enough for the exam.
