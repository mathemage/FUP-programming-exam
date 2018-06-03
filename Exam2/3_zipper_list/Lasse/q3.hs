type ZipList a = ([a], [a])

newList :: ZipList a
newList = ([], [])

moveLeft :: ZipList a -> ZipList a
moveLeft (x:ls1, ls2) = (ls1, x:ls2)
moveLeft ([], ls2) = undefined

moveRight :: ZipList a -> ZipList a
moveRight (ls1, x:ls2) = (x:ls1, ls2)
moveRight (ls1, []) = undefined

rewind :: ZipList a -> ZipList a
rewind ([], ls2) = ([], ls2)
rewind (x:ls1, ls2) = rewind (ls1, x:ls2)

index :: ZipList a -> Int
index (ls1, ls2) = length ls1

moveTo :: Int -> ZipList a -> ZipList a
moveTo n zl = iterate moveRight (rewind zl) !! n

get :: ZipList a -> a
get (_, ls) = head ls

update :: a -> ZipList a -> ZipList a
update x (ls1, ls2) = (ls1, x : tail ls2)

insert :: a -> ZipList a -> ZipList a
insert x (ls1, ls2) = (ls1, x:ls2)

delete :: ZipList a -> ZipList a
delete (ls1, ls2) = (ls1, tail ls2)
