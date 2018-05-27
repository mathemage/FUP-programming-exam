stringToDoubles :: String -> [Double]
stringToDoubles line = map read (words line)

lengthAsDouble :: [a] -> Double
lengthAsDouble = fromIntegral . length

minMean :: [Double] -> Double
minMean = minimum

-- -- https://en.wikipedia.org/wiki/Geometric_mean
geometricMean :: [Double] -> Double
geometricMean doubles = product doubles ** (1 / lengthAsDouble doubles)

arithmeticMean :: [Double] -> Double
arithmeticMean doubles = sum doubles / lengthAsDouble doubles

maxMean :: [Double] -> Double
maxMean = maximum

-- testLine   = "1 2 39.3 2 3 -12 3.1415 -3.1415"
testLine   = "1 2 3 4"
testDoubles = stringToDoubles testLine

main :: IO ()
main = do
--   line <- getLine
--   print . stringToDoubles $ line
  print testDoubles
  print $ "minMean == " ++ (show . minMean $ testDoubles)
  print $ "geometricMean == " ++ (show . geometricMean $ testDoubles)
  print $ "arithmeticMean == " ++ (show . arithmeticMean $ testDoubles)
  print $ "maxMean == " ++ (show . maxMean $ testDoubles)