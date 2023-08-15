-- Maybe monad to handle optional values
safeDivide :: Double -> Double -> Maybe Double
safeDivide _ 0 = Nothing
safeDivide x y = Just (x / y)

-- IO monad for input/output
main :: IO ()
main = do
  putStrLn "Enter two numbers:"
  num1 <- readLn
  num2 <- readLn
  case safeDivide num1 num2 of
    Just result -> putStrLn $ "Result: " ++ show result
    Nothing     -> putStrLn "Cannot divide by zero"
