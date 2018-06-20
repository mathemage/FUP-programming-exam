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
Here, `p` indicates whether or not the string that ends at the current node is present (indicated as black and white in the picture)
Variable `m` is an associative map represented as a list of list-pairs, `((k1 v1) (k2 v2) (k3 v3) ...)`.
The mapping contains an entry for each character in the alphabet that has a non-empty subtree.
The value that corresponds to a character in the mapping is again a trie node `(p2 m2)`.
Note that in Scheme, the character 'a' is encoded as `#\a`.
**Note:** This means that for example the trie `(#t ((#\a (#f ()))))` is **not valid**, because the subtree corresponding to 'a' is empty.
This trie should therefore have been represented as `(#t ())`.

In order to implement operations on the trie, first implement some helper functions for map:

```scheme
(find-map k m d)
```
Looks up the value that corresponds to key `k` in `m`. If `k` is not in the map, return the default `d`.

```scheme
(replace-map k v m)
```
Replaces the previous value associated with `k` in `m` with `v`. If `k` is not in the map, it is added.

```scheme
(delete-map k m)
```
Deletes `k` and the value associated with `k` from `m`.

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

```scheme
(delete-trie s t)
```
Delete a string `s` from a tree `t`. **Note:** Pay attention with this function. 
Suppose that you have a trie that contains only the string "aa". 
This would be represented as `(#f ((#\a (#f ((#\a (#t ())))))))`.
The most obvious way to delete the string "aa" is to return `(#f ((#\a (#f ((#\a (#f ())))))))`.
However, now there are superfluous nodes in the trie, because the trie is completely empty.
Take care to remove these superfluous nodes.

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

(define d1
  (delete-trie "trap" t2))
; (#f ((#\t (#f ((#\r (#f ((#\i (#f ((#\c (#f ((#\k (#t ()))))))))))) (#\e (#f ((#\a (#t ()))))))))))

(define l3
  (lookup-trie "trap" d1))
; #f

(define t3
  (insert-trie "a" (insert-trie "aaa" empty-trie)))
; (#f ((#\a (#t ((#\a (#f ((#\a (#t ()))))))))))

(define d2
  (delete-trie "a" t3))
; (#f ((#\a (#f ((#\a (#f ((#\a (#t ()))))))))))

(define d3
  (delete-trie "aaa" t3))
; (#f ((#\a (#t ()))))
```
