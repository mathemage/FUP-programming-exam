# Trie [Haskell]

A trie is a datastructure that kan be used to efficiently insert, lookup and delete strings.
The trie is a special kind of tree. Every path in the tree represents a string (which means that every edge represents a character).
An example of a trie can be seen below.

![](http://quinnftw.com/assets/images/trie.jpg)

This trie contains the strings `a, at, ate, on, one, out, me , mud, my`.
Note, however, that the trie does not contain the empty string nor `o, ou, m, mu`.
A string is only 'present' in the trie when the node that ends the string is black.

Write a module `Trie` in haskell provides the functionality of a trie.
The trie will be encoded as follows:

```haskell
type Map k v = [(k, v)]
data Trie = Node Bool (Map Char Trie) deriving Show
```

The type `Maps k v` represents a simple associative map.
`Trie` has one constructor `Node p m` that takes a boolean `p` and a mapping `m` between characters and tries.
Here, `p` indicates whether or not the string that ends at the current node is present (indicated as black and white in the picture)
The mapping `m` contains an entry for each character in the alphabet that has a non-empty subtree.
**Note:** This means that for example the trie `Node True [('a', Node False [])]` is **not valid**, because the subtree corresponding to 'a' is empty.
This trie should therefore have been represented as `Node True []`.

In order to implement operations on the trie, first implement some helper functions for map:

```haskell
findMap :: Eq k => k -> Map k v -> v -> v
```
`findMap k m d` looks up the value that corresponds to key `k` in `m`. If `k` is not in the map, return the default `d`.

```haskell
replaceMap :: Eq k => k -> v -> Map k v -> Map k v
```
`replaceMap k v m` replaces the previous value associated with `k` in `m` with `v`. If `k` is not in the map, it is added.

```haskell
deleteMap :: Eq k => k -> Map k v -> Map k v
```
`deleteMap k m` deletes `k` and the value associated with `k` from `m`.

Armed with these operations, we can now implement operations on the trie:

```haskell
emptyTrie :: Trie
```
The empty trie.

```haskell
insertTrie :: String -> Trie -> Trie
```
Insert a string into a trie.

```haskell
lookupTrie :: String -> Trie -> Bool
```
Check if a string exists in a trie.

```haskell
deleteTrie :: String -> Trie -> Trie
```
Delete a string from a tree. **Note:** Pay attention with this function. 
Suppose that you have a trie that contains only the string "aa". 
This would be represented as `Node False [('a', Node False [('a', Node True [])])]`.
The most obvious way to delete the string "aa" is to return `Node False [('a', Node False [('a', Node False [])])]`.
However, now there are superfluous nodes in the trie, because the trie is completely empty.
Take care to remove these superfluous nodes.

# Examples
```haskell
t1 = insertTrie "" emptyTrie
-- Node True []

t2 = insertTrie "tea" . insertTrie "trap" . insertTrie "trick" $ emptyTrie
-- Node False [('t',Node False [('r',Node False [('i',Node False [('c',Node False [('k',Node True [])])]),('a',Node False [('p',Node True [])])]),('e',Node False [('a',Node True [])])])]

l1 = lookupTrie "tea" t2
-- True

l2 = lookupTrie "te" t2
-- False

d1 = deleteTrie "trap" t2
-- Node False [('t',Node False [('r',Node False [('i',Node False [('c',Node False [('k',Node True [])])])]),('e',Node False [('a',Node True [])])])]

l3 = lookupTrie "trap" d1
-- False

t3 = insertTrie "a" . insertTrie "aaa" $ emptyTrie
-- Node False [('a',Node True [('a',Node False [('a',Node True [])])])]

d2 = deleteTrie "a" $ t3
-- Node False [('a',Node False [('a',Node False [('a',Node True [])])])]

d3 = deleteTrie "aaa" t3
-- Node False [('a',Node True [])]
```
