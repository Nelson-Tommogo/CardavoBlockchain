{- Multiples of 13 Test-----
-}
multiplesOf13 :: [Int]
multiplesOf13 = [13, 26 .. 9999]

intertwine :: [a] -> [a] -> [a]
intertwine [] ys = ys
intertwine xs [] = xs
intertwine (x:xs) (y:ys) = x : y : intertwine xs ys

main :: IO ()
main = do
    putStrLn "First 3 multiples of 13:"
    print (take 3 multiplesOf13)

    putStrLn "No. of Multiples of 13 less than 10000 Are"
    print (length multiplesOf13)

    putStrLn " Ny Intertwined list:"
    print (intertwine [4, 9, 7] [15, 19])