# Trie [Haskell]

A trie is a datastructure that kan be used to efficiently insert, lookup and delete strings.
The trie is a special kind of tree. Every path in the tree represents a string (which means that every edge represents a character).
An example of a trie can be seen below.

![](http://quinnftw.com/assets/images/trie.jpg)

This trie contains the strings `a, at, ate, on, one, out, me , mud, my`.
Note, however, that the trie does not contain the empty string nor `o, ou, m, mu`.
A string is only 'present' in the trie when the node that ends the string is black.

Write a module `Trie` in haskell that provides the functionality of a trie.
The trie will be encoded as follows:

```haskell
type Map k v = [(k, v)]
data Trie = Node Bool (Map Char Trie) deriving Show
```

The type `Maps k v` represents a simple associative map.
`Trie` has one constructor `Node p m` that takes a boolean `p` and a mapping `m` between characters and tries.
Here, `p` indicates whether or not the string that ends at the current node is present (indicated as black and white in the picture)
The mapping `m` contains an entry for each character in the alphabet that has a non-empty subtree.

In order to implement operations on the trie, we provide you with the following two functions that operate on associative maps:

```haskell
findMap :: Eq k => k -> Map k v -> v -> v
findMap k [] d = d
findMap k ((k', v):ls) d | k == k'   = v
                         | otherwise = findMap k ls d

replaceMap :: Eq k => k -> v -> Map k v -> Map k v
replaceMap k v [] = [(k, v)]
replaceMap k v ((k', v'):ls) | k == k'   = (k, v):ls
                             | otherwise = (k', v') : replaceMap k v ls
```
`findMap k m d` looks up the value that corresponds to key `k` in `m`. If `k` is not in the map, return the default `d`.
`replaceMap k v m` replaces the previous value associated with `k` in `m` with `v`. If `k` is not in the map, it is added.

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
```
