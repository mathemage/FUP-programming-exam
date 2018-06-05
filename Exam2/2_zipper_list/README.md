# 2. Zipper List [Scheme]

A downside of the purity in functional programming languages is that it can be difficult and slow to update lists. For a normal list,
updating an arbitrary element from the list takes O(n) time. We will implement a so-called Zipper List that
can make local updates in constant time.

The datastructure of a zipper list consists of a list containing two list. See the following example:

```scheme
((3 2 1) (4 5 6))
```
The zipper list allows you to keep a certain index of the list under 'focus'.
All the elements on the left side of the focus go in the first list of the zipper (in this case 1 2 and 3).
Likewise, all the elements on the right side of the focus go in the second list of the zipper (in this case 4 5 6).
If we where to convert the zipper list above to a normal list it would become
```scheme
(1 2 3 4 5 6)
```

Write the following functions that operate on the zipper list:

```scheme
new-list
```

Creates an empty list

```scheme
(move-left zl)
```
Moves the focus to the left. If this is not possible the program is allowed to crash.

```scheme
(move-right zl)
```
Moves the focus to the right. If this is not possible the program is allowed to crash

```scheme
(rewind zl)
```
Rewinds a zipper list so that the focus is on the beginning of the list.

```scheme
(index zl)
```
Returns a number that represents the index the zipper list is foccused on. For the example above this would be `3`.

```scheme
(move-to n zl)
```
`(moveTo n zl)` moves the focus of `zl` to the `n`-th index of the list. If `n` is bigger than the size of the list the program may crash.

```scheme
(get zl)
```
Returns the element of the list that is currently to the right of the focus. If there is no element to the right of the focus the program may crash.

```scheme
(update x zl)
```
Updates the element to the right of the focus. If there is no element to the right of the focus, the program may crash.

```scheme
(insert x zl)
```
Insert a new element to the right of the focus.

```haskell
(delete zl)
```
Deletes the element to the right of the focus. If there is no element to the right, the program may crash.

## Examples
```scheme
(define t1
  (insert 1 (insert 2 (insert 3 (insert 4 (insert 5 new-list))))))
; (() (1 2 3 4 5))

(define t2
  (delete (move-right (move-right (move-right (move-right
  (insert 102 (move-right
  (update 101 (move-left (move-left (move-left
  (update 100 (move-right (move-right (move-right t1))))))))))))))))
; ((100 3 2 102 101) ())

(define t3
  (move-left (move-left t2)))
; ((2 102 101) (3 100))

(define t4
  (get t3))
; 3

(define t5
  (rewind t2))
; (() (101 102 2 3 100))

(define t6
  (index t3))
; 3

(define t7
  (move-to 1 t3))
; ((101) (102 2 3 100))
```

## Tests
```scheme
(define (law-left-right zl)
  (equal? (move-right (move-left zl)) zl))

(define (law-right-left zl)
  (equal? (move-left (move-right zl)) zl))

(define (law-move-to-index zl)
  (equal? (move-to (index zl) zl) zl))

(define (law-insert-delete-get zl)
  (equal? (insert (get zl) (delete zl)) zl))

(define (law-update-get zl)
  (equal? (update (get zl) (update 0 zl)) zl))

(define (law-rewind zl)
  (equal? (rewind (rewind zl)) (rewind zl)))

(define (law-insert zl)
  (equal? (get (insert 2156548 zl)) 2156548))

(define (law-insert2 zl)
  (equal? (get (move-left (move-right (insert 2156548 zl)))) 2156548))

(define laws
  (list
   law-left-right
   law-right-left
   law-move-to-index
   law-insert-delete-get
   law-update-get
   law-rewind
   law-insert
   law-insert2
   ))

(define tests
  '(
    ((1 2) (3 4))
    ((1 2 3) (4))
    ((1) (2 3 4))
   ))

(define test
  (map (lambda (t) (map (lambda (l) (l t)) laws)) tests))
```
