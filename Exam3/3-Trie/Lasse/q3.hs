module Trie where

type Map k v = [(k, v)]

findMap :: Eq k => k -> Map k v -> v -> v
findMap k [] d = d
findMap k ((k', v):ls) d | k == k'   = v
                         | otherwise = findMap k ls d

replaceMap :: Eq k => k -> v -> Map k v -> Map k v
replaceMap k v [] = [(k, v)]
replaceMap k v ((k', v'):ls) | k == k' = (k, v):ls
                             | otherwise = (k', v') : replaceMap k v ls

deleteMap :: Eq k => k -> Map k v -> Map k v
deleteMap k [] = []
deleteMap k ((k', v'):ls) | k == k'   = ls
                          | otherwise = (k', v') : deleteMap k ls

data Trie = Node Bool (Map Char Trie) deriving Show

emptyTrie :: Trie
emptyTrie = Node False []

insertTrie :: String -> Trie -> Trie
insertTrie [] (Node _ m) = Node True m
insertTrie (c:s) (Node p m) = let st = findMap c m emptyTrie
                                  nt = insertTrie s st
                                  nm = replaceMap c nt m in
                                Node p nm

lookupTrie :: String -> Trie -> Bool
lookupTrie [] (Node p _) = p
lookupTrie (c:s) (Node _ m) = lookupTrie s (findMap c m emptyTrie)

deleteTrie :: String -> Trie -> Trie
deleteTrie [] (Node _ m) = Node False m
deleteTrie (c:s) (Node p m) = let st = findMap c m emptyTrie in
                                case deleteTrie s st of
                                  (Node False []) -> Node p (deleteMap c m)
                                  nt              -> Node p (replaceMap c nt m)

t1 = insertTrie "" emptyTrie
t2 = insertTrie "tea" . insertTrie "trap" . insertTrie "trick" $ emptyTrie
l1 = lookupTrie "tea" t2
l2 = lookupTrie "te" t2
d1 = deleteTrie "trap" t2
l3 = lookupTrie "trap" d1
t3 = insertTrie "a" . insertTrie "aaa" $ emptyTrie
d2 = deleteTrie "a" $ t3
d3 = deleteTrie "aaa" t3
