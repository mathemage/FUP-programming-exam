# 1. Red-Black Paths [Scheme]

Count number of possible red-black paths with **n** vertices.

### Red-Black Path Coloring

A red-black tree:

![Red-Black Tree](rbt.svg)
is a variant of *self-balancing binary search trees*,
e.g. used as the underlying data structure for `map` and `set` in the C++ Standard Template Library.

For the simplicity of the exam, let's ourselves restrict only to red-black paths.
So we will consider only red-black trees where each vertex has at most 1 child:

![Red-Black Path](rbp.png)

A **red-black path** is a (directed) graph such that:
* It is a **path**.
* Each vertex has either **red** or **black** color.
* Any *red* vertex can only have a **black child**.
(In other words, there can never be two red vertices next to each other.)

A **red-black path coloring** is an assignment of colors to path vertices such that the *resulting coloring is a valid red-black path*.

### Implementation in Scheme

In Scheme, implement a function
```scheme
(rbp n)
``` 
which returns *the total number of valid red-black path colorings on **n >= 0** vertices*.

## Examples
For `0`, `1`, `2`, `10`, `20` and `40` the corresponding values of `(rbp n)` are:
```
> (map rbp '(0 1 2 10 20 40))
(1 2 3 144 17711 267914296)
```

## Hints

Any solution is okay, even the very inefficient one.
There are several alternative solutions to this problem and we are not forcing you into any specific.
Should you feel especially in need of hints, you may find some ideas to some approaches below.

We will test for **n <= TODO @Lasse DECIDE ON UPPER LIMIT HERE**.
As long as your solution can manage `(rbp TODO DECIDE ON UPPER LIMIT HERE)`, it's efficient enough for this exam.

From following hints, you should be able to come up with a recursive formula for `(rbp n)`.

**SPOILER ALERT - BELOW!**

**@Lasse Use this hint only after 15 min of struggling without any idea.**
* Analyse the problem in such a way that the recursion can be used.
Can you reduce the problem to "sub-instances" of the same problem?

**@Lasse Use another hint only after another 15 min of struggling without any idea.**
* Focus on the root vertex and the 2 cases for the root's color.
For each of the root's color, which colors can follow in the child?
Which "subproblems" are hidden in each of those cases?
