intertwine :: [a] -> [a] -> [a]
intertwine [] ys = ys
intertwine xs [] = xs
intertwine (x:xs) (y:ys) = x : y : intertwine xs ys

main :: IO ()
main = do
    putStrLn "New Intertwined list:"
    print (intertwine [4, 9, 7] [15, 19])
