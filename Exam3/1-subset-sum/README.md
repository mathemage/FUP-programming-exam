# Subset Sum [Scheme]

Let `ls` be a **set** of positive (non-zero) numbers, and `k` and `n` non-negative (possibly zero) integers.
We are interested in all **unique** subsets of `ls` of size `k` that sum exactly to `n`.
For this, we write the following function in Scheme.

```scheme
(subset-sum-unique ls k n)
```
As always, we represent sets in lisp as lists. However, because they represent sets, they will not contain duplicates.
The output of this function will be a list of lists of numbers.
Every list of numbers must be a subset of `ls`, must be of length `k` and must sum to exactly `n`.
Pay attention to the fact that the output lists are also regarded as sets.
Therefore, make sure that you do not output permutations of the same subsets, as that would be invalid.

## Examples
```scheme
(subset-sum-unique '(2 4 3 1 5) 2 6)
((2 4) (1 5))

(subset-sum-unique '(2 4 3 1 5) 3 6)
((2 3 1))

(subset-sum-unique '(2 4 3 1 5) 4 6)
()

(subset-sum-unique '(1 2 3 4 5 6 7 8 9 10) 2 15)
((5 10) (6 9) (7 8))

(subset-sum-unique '(1 2 3 4 5 6 7 8 9 10) 3 15)
((1 4 10) (1 5 9) (1 6 8) (2 3 10) (2 4 9) (2 5 8) (2 6 7) (3 4 8) (3 5 7) (4 5 6))

(subset-sum-unique '(1 2 3 4 5 6 7 8 9 10) 4 15)
((1 2 3 9) (1 2 4 8) (1 2 5 7) (1 3 4 7) (1 3 5 6) (2 3 4 6))

(subset-sum-unique '(1 2 3 4 5 6 7 8 9 10) 5 15)
((1 2 3 4 5))
 ```
