-- created in ~70 min
stringToDoubles :: String -> [Double]
stringToDoubles line = map read (words line)

lengthAsDouble :: [a] -> Double
lengthAsDouble = fromIntegral . length

-- https://en.wikipedia.org/wiki/Harmonic_mean
harmonicMean :: [Double] -> Double
harmonicMean doubles = lengthAsDouble doubles / (sum . map (1/) $ doubles)

-- https://en.wikipedia.org/wiki/Geometric_mean
geometricMean :: [Double] -> Double
geometricMean doubles = product doubles ** (1 / lengthAsDouble doubles)

arithmeticMean :: [Double] -> Double
arithmeticMean doubles = sum doubles / lengthAsDouble doubles

-- https://en.wikipedia.org/wiki/Root_mean_square
quadraticMean :: [Double] -> Double
quadraticMean doubles = ( (sum . map (** 2) $ doubles) / lengthAsDouble doubles ) ** 0.5

mean :: String -> [Double] -> Double
mean variant
  | variant == "harmonic"   = harmonicMean
  | variant == "geometric"  = geometricMean
  | variant == "arithmetic" = arithmeticMean
  | variant == "quadratic"  = quadraticMean

printMean :: String -> String -> IO ()
printMean variant = print . mean variant . stringToDoubles

testVersion = 1
testLine
  | testVersion == 1 = "1 2 3 4"
  | testVersion == 2 = "1 2 39.3 2 3 -12 3.1415 -3.1415"
testDoubles = stringToDoubles testLine

main :: IO ()
main = do
{-  printMean "harmonic" testLine
  printMean "geometric" testLine
  printMean "arithmetic" testLine
  printMean "quadratic" testLine-}
  -- from IO
  numbers <- getLine
  variantOfMean <- getLine
  printMean variantOfMean numbers
