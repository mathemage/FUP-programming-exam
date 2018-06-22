-- Solution 1

wordIndex :: [Int] -> Int -> Int
wordIndex words n = i
  where
    (c, i) = foldl f (0, 0) words
    f (c, i) m | c + m + 1 > n = (c + m + 1, i)
               | otherwise     = (c + m + 1, i + 1)

countUntil (' ':s) = 1 + countUntil s
countUntil _ = 0

sumNatN ls n = sum . take (ls !! n) . drop (n + 1) . cycle $ ls

main :: IO ()
main = do s1 <- getLine
          s2 <- getLine
          let nums = words s1
          let wi = (wordIndex (map length nums) (countUntil s2))
          putStrLn . show . sumNatN (map read nums) $ wi

-- Solution 2

solve :: [String] -> Int -> Int
solve (s:ls) n | l + 1 > n = sum . map read . take i $ ls
               | otherwise       = solve ls (n - l - 1)
               where l = length s
                     i = read s

main2 :: IO ()
main2 = do s1 <- getLine
           s2 <- getLine
           putStrLn . show $ solve (cycle . words $ s1) (countUntil s2)
