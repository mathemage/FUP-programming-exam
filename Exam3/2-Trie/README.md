# Trie [Scheme]

A trie is a datastructure that kan be used to efficiently insert, lookup and delete strings.
The trie is a special kind of tree. Every path in the tree represents a string (which means that every edge represents a character).
An example of a trie can be seen below.

![](http://quinnftw.com/assets/images/trie.jpg)

This trie contains the strings `a, at, ate, on, one, out, me , mud, my`.
Note, however, that the trie does not contain the empty string nor `o, ou, m, mu`.
A string is only 'present' in the trie when the node that ends the string is black.

Write functions that can operate on a trie in Scheme.
A trie is encoded in Scheme as follows:

A node in a trie is a list-pair `(p m)`.
Here, `p` is a boolean that indicates whether or not the string that ends at the current node is present (indicated as black and white in the picture)
Variable `m` is an associative map represented as a list of list-pairs, `((k1 v1) (k2 v2) (k3 v3) ...)`.
The mapping contains an entry for each character in the alphabet that has a non-empty subtree.
The value that corresponds to a character in the mapping is again a trie node `(p2 m2)`.
Note that in Scheme, the character 'a' is encoded as `#\a`.

In order to implement operations on the trie, we provide you with the following two functions that operate on associative maps:

```scheme
(define (find-map k m d)
  (cond ((null? m) d)
        ((equal? k (caar m)) (cadar m))
        (else (find-map k (cdr m) d))))

(define (replace-map k v m)
  (cond ((null? m) (list (list k v)))
        ((equal? k (caar m)) (cons (list k v) (cdr m)))
        (else (cons (car m) (replace-map k v (cdr m))))))
```

`(find-map k m d)` looks up the value that corresponds to key `k` in `m`. If `k` is not in the map, return the default `d`.
`(replace-map k v m)` replaces the previous value associated with `k` in `m` with `v`. If `k` is not in the map, it is added.

Armed with these operations, we can now implement operations on the trie. These operations should work on Scheme strings.
These are a special datastructure, and can be written down as `"string"`.
However, in order to use a string, you will want to convert it to a list of characters.
This can be done by calling `(string->list "string")`.

```scheme
empty-trie
```
The empty trie.

```scheme
(insert-trie s t)
```
Insert a string `s` into a trie `t`.

```scheme
(lookup-trie s t)
```
Check if a string `s` exists in a trie `t`.

# Examples
```scheme
(define t1
  (insert-trie "" empty-trie))
; (#t ())

(define t2
  (insert-trie "tea" (insert-trie "trap" (insert-trie "trick" empty-trie))))
; (#f ((#\t (#f ((#\r (#f ((#\i (#f ((#\c (#f ((#\k (#t ())))))))) (#\a (#f ((#\p (#t ())))))))) (#\e (#f ((#\a (#t ()))))))))))

(define l1
  (lookup-trie "tea" t2))
; #t

(define l2
  (lookup-trie "te" t2))
; #f
```
