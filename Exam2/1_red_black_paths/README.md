# 1. Red-Black Paths [Scheme]

Count number of possible red-black paths with **n** vertices.

### Red-Black Path Coloring

A red-black tree (see below):

![Red-Black Tree](rbt.svg)
is a variant of *self-balancing binary search tree*,
e.g. used as the underlying data structure for `map` and `set` in the C++ Standard Template Library.

For the simplicity of the exam, let's restrict only on red-black paths for now.
So we will consider only red-black trees where each vertex has at most 1 child:

![Red-Black Path](rbp.png)


### Implementation in Scheme

In Scheme, implement a function
```scheme
(rbp n)
``` 
For a given integer **n >= 0**, `(rbp n)` returns *the total number of valid red-black path colorings on **n** vertices*.

## Examples
For `0`, `1`, `2`, `10`, `20` and `40` the corresponding values of `(rbp n)` are:
```
> (map rbp '(0 1 2 10 20 40))
(1 2 3 144 17711 267914296)
```

## Hints

Any solution is okay, even the very inefficient one.
There are several ways how to solve this problem and we are not forcing you into any specific.
Should you feel especially in need of hints, you may find some ideas to some approaches below.

Keep in mind there may be alternative solutions to this and we are not pushing you into any specific implementation. 
We will test for **n <= TODO DECIDE ON UPPER LIMIT HERE** so as long as your solution can manage `(rbp 17)`, it's efficient enough for this exam.

### Approach 1: recursive calculation
* **TODO**

From these hints, you can come up with a recursive formula for `(rbp n)`.
