stringToFloats :: String -> [Float]
stringToFloats line = map read (words line)

minMean :: [Float] -> Float
minMean = minimum

maxMean :: [Float] -> Float
maxMean = maximum

-- testLine   = "1 2 39.3 2 3 -12 3.1415 -3.1415"
testLine   = "1 2 3 4"
testFloats = stringToFloats testLine

main :: IO ()
main = do
--   line <- getLine
--   print . stringToFloats $ line
  print testFloats
  print $ "min == " ++ (show . minMean $ testFloats)
  print $ "max == " ++ (show . maxMean $ testFloats)
--   print . maxMean $ testFloats
