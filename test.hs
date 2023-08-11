addTwoNumbers :: Num a => a -> a -> a
addTwoNumbers x y = x + y

main :: IO ()
main = do
    putStrLn "Enter the first number:"
    input1 <- getLine
    putStrLn "Enter the second number:"
    input2 <- getLine
    let num1 = read input1
        num2 = read input2
        result = addTwoNumbers num1 num2
    putStrLn ("The sum is: " ++ show result)
