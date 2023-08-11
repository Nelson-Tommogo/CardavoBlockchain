data Employee = Employee
    { firstName :: String
    , lastName :: String
    , employeeId :: Int
    , isActive :: Bool
    }
    
fullName :: Employee -> String
fullName emp = firstName emp ++ " " ++ lastName emp

-- Example usage
main :: IO ()
main = do
    let employee = Employee "Nelson" "Tommogo" 1000 True
    putStrLn $ "Full name: " ++ fullName employee
