-- total time:

stringToDoubles :: String -> [Double]
stringToDoubles line = map read (words line)

-- normalize values between 0 and 1
normalize :: [Double] -> [Double]
normalize values = map ((/ scale) . (subtract shift)) values
  where shift = minimum values
        scale = maximum values - shift

-- bucket values between 0 and 1 into n buckets
bucket :: Int -> [Double] -> [Int]
bucket bins = map ((min (bins - 1)) . floor . (* (fromIntegral bins)))

frequencies :: Int -> [Int] -> [Int]
frequencies bins indices = [length . filter (==bin) $ indices | bin <- [0..bins-1]]

visualize :: [Int] -> String
visualize = concat . map (\count -> ":" ++ (replicate count '|') ++ "\n")

-- TODO not finished
printHistogram :: Int -> String -> IO ()
printHistogram bins = putStr . visualize . frequencies bins . bucket bins . normalize . stringToDoubles

testVersion = 0
primes = "2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 \
\ 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313\
\ 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499\
\ 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691\
\ 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907\
\ 911 919 929 937 941 947 953 967 971 977 983 991 997"
fibonacci = "0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765 10946 17711 28657 46368 75025 121393\
\ 196418 317811"
testLine
  | testVersion == 0 = "0 1 2 3 4 5"
  | testVersion == 1 = "-3.14 -3 -2 -1 0 1 2 3 3.14"
  | testVersion == 2 = primes
  | testVersion == 3 = fibonacci
testDoubles = stringToDoubles testLine
testBins = 5

main :: IO ()
main = do
  print testLine
  print testBins
  print . stringToDoubles $ testLine
  print . normalize . stringToDoubles $ testLine
  print . bucket testBins . normalize . stringToDoubles $ testLine
  print . frequencies testBins . bucket testBins . normalize . stringToDoubles $ testLine
  printHistogram testBins testLine

{-  -- from IO
  lineOfValues <- getLine
  print lineOfValues
  printHistogram lineOfValues-}
