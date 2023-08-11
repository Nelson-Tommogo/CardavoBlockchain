data Employee = Employee
    { firstName :: String
    , lastName :: String
    , salary :: Float
    , info :: String
    }

fullName :: Employee -> String
fullName emp = firstName emp ++ " " ++ lastName emp

doubleSalary :: Employee -> Employee
doubleSalary emp = emp { salary = 2 * salary emp }

main :: IO ()
main = do
    let employee = Employee "Charles" "Hoskinson" 1000.0 "info"
    putStrLn $ "Full name: " ++ fullName employee
    putStrLn $ "Original salary: " ++ show (salary employee)
    
    let doubledEmployee = doubleSalary employee
    putStrLn $ "Doubled salary: " ++ show (salary doubledEmployee)
