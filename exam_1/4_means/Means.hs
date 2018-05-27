stringToFloats :: String -> [Float]
stringToFloats line = map read (words line)

maxMean :: [Float] -> Float
maxMean = maximum

testLine =  "1 2 39.3 2 3 -12 3.1415 -3.1415"
testFloats = stringToFloats testLine

main :: IO ()
main = do
  line <- getLine
  print . stringToFloats $ line
--   print . stringToFloats $ line
