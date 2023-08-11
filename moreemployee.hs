data Employee a = Employee
    { firstName :: String
    , lastName :: String
    , salary :: Float
    , info :: a
    }

doubleSalary :: Employee a -> Employee a
doubleSalary emp = emp { salary = 2 * salary emp }

instance Functor Employee where
    fmap f emp = emp { info = f (info emp) }

main :: IO ()
main = do
    let employee = Employee "Charles" "Hoskinson" 1000.0 True
    putStrLn $ "Original salary: " ++ show (salary employee)
    
    let doubledEmployee = doubleSalary employee
    putStrLn $ "Doubled salary: " ++ show (salary doubledEmployee)
    
    let newEmployee = fmap not employee
    putStrLn $ "Modified info: " ++ show (info newEmployee)
