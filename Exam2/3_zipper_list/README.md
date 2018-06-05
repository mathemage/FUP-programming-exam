# 3. Zipper List [Haskell]

A downside of the purity in Haskell is that it can be difficult and slow to update lists. For a normal list,
updating an arbitrary element from the list takes O(n) time. We will implement a so-called Zipper List that
can make local updates in constant time.

Create a module named `ZipList` with the following functionality:

The datatype of the zipper list is as follows:

```haskell
type ZipList a = ([a], [a])
```
The zipper list allows you to keep a certain index of the list under 'focus'.
All the elements on the left side of the focus go in the first list of the zipper.
Likewise, all the elements on the right side of the focus go in the second list of the zipper.

Write the following functions that operate on the zipper list:

```haskell
newList :: ZipList a
```

Creates an empty list

```haskell
moveLeft :: ZipList a -> ZipList a
```
Moves the focus to the left. If this is not possible the program may crash.

```haskell
moveRight :: ZipList a -> ZipList a
```
Moves the focus to the right. If this is not possible the program may crash.

```haskell
rewind :: ZipList a -> ZipList a
```
Rewinds a zipper list so that the focus is on the beginning of the list.

```haskell
index :: ZipList a -> Int
```
Returns the index the zipper list is foccused on.

```haskell
moveTo :: Int -> ZipList a -> ZipList a
```
`moveTo n zl` moves the focus of `zl` to the `n`-th index of the list. If `n` is bigger than the size of the list the program may crash.

```haskell
get :: ZipList a -> a
```
Returns the element of the list that is currently to the right of the focus. If there is no element to the right of the focus the program may crash.

```haskell
update :: a -> ZipList a -> ZipList a
```
Updates the element to the right of the focus. If there is no element to the right of the focus, the program may crash.

```haskell
insert :: a -> ZipList a -> ZipList a
```
Insert a new element to the right of the focus.

```haskell
delete :: ZipList a -> ZipList a
```
Deletes the element to the right of the focus. If there is no element to the right, the program may crash.

## Examples
```haskell
t1 = insert 1 . insert 2 . insert 3 . insert 4 . insert 5 $ newList
-- ([],[1,2,3,4,5])

t2 = delete .  moveRight . moveRight . moveRight . moveRight
   . insert 102 . moveRight
   . update 101 . moveLeft . moveLeft . moveLeft
   . update 100 . moveRight . moveRight . moveRight $ t1
-- ([100,3,2,102,101],[])

t3 = moveLeft . moveLeft $ t2
-- ([2,102,101],[3,100])

t4 = get t3
-- 3

t5 = rewind t2
-- ([],[101,102,2,3,100])

t6 = index t3
-- 3

t7 = moveTo 1 t3
-- ([101],[102,2,3,100])
```

## Tests
```haskell
lawLeftRight zl = (moveRight . moveLeft $ zl) == zl
lawRightLeft zl = (moveLeft . moveRight $ zl) == zl
lawMoveToIndex zl = (moveTo (index zl) zl) == zl
lawInsertDeleteGet zl = (insert (get zl) . delete $ zl) == zl
lawUpdateGet zl = (update (get zl) . update 0 $ zl) == zl
lawRewind zl = (rewind . rewind $ zl) == rewind zl
lawInsert zl = (get . insert 2156548 $ zl) == 2156548
lawInsert2 zl = (get . moveLeft . moveRight . insert 785 $ zl) == 785

laws = [ lawLeftRight, lawRightLeft, lawMoveToIndex
       , lawInsertDeleteGet, lawUpdateGet, lawRewind
       , lawInsert, lawInsert2]

tests :: [ZipList Int]
tests = [ -- ([], [])
        --, ([], [1]) These tests are sometimes undefined
        --, ([1], [])
          ([1,2], [3,4])
        , ([1, 2, 3], [4])
        , ([1], [2, 3, 4])]

test = map (\t -> map ($ t) laws) tests
```
