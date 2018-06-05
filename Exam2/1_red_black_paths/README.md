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
