tuple1 :: (Double, Char)
tuple1 = (4.667, 'b')

firstElement :: Double
firstElement = fst tuple1

tuple2 :: (String, Int, String, Bool)
tuple2 = ("Nelson", 22, "Years", True)

firstElement2 :: String
firstElement2 = case tuple2 of
    (x, _, _, _) -> x

main :: IO ()
main = do
    putStrLn $ "First element of tuple1: " ++ show firstElement
    putStrLn $ "First element of tuple2: " ++ firstElement2
