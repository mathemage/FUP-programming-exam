minMean :: [Double] -> Double
minMean = minimum

maxMean :: [Double] -> Double
maxMean = maximum

dlength = fromIntegral . length

arithmeticMean :: [Double] -> Double
arithmeticMean ls = sum ls / dlength ls

geometricMean :: [Double] -> Double
geometricMean ls = product ls ** (1 / dlength ls)

quadraticMean :: [Double] -> Double
quadraticMean ls = sqrt (sum (map (^2) ls) / dlength ls)

harmonicMean :: [Double] -> Double
harmonicMean ls = dlength ls / sum (map (1 /) ls)

stringToDoubles :: String -> [Double]
stringToDoubles ls = map read (words ls)

pairs = [("minMean", minMean)
        ,("harmonicMean", harmonicMean)
        ,("geometricMean", geometricMean)
        ,("arithmeticMean", arithmeticMean)
        ,("quadraticMean", quadraticMean)
        ,("maxMean", maxMean)]

main = do s <- getLine
          let ls = stringToDoubles s
          putStrLn . show $ ls
          mapM_ (\ (s, f) -> putStrLn (s ++ " == " ++ (show . f $ ls))) pairs
