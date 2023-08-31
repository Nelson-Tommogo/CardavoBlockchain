-- A program to work with lists

numbers :: [Int]
numbers = [1, 2, 3, 4, 5]

squaredNumbers :: [Int]
squaredNumbers = [x * x | x <- numbers]

main :: IO ()
main = do
    putStrLn "Original List:"
    print numbers
    
    putStrLn "Squared Numbers:"
    print squaredNumbers
    
    putStrLn "Length of the List:"
    print (length numbers)
    
    putStrLn "First Element:"
    print (head numbers)
    
    putStrLn "Rest of the List:"
    print (tail numbers)
    
    putStrLn "Last Element:"
    print (last numbers)
    
    putStrLn "Initial Elements:"
    print (init numbers)
