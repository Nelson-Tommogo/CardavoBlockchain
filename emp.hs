data Employee a = Employee
    { firstName :: String
    , lastName :: String
    , salary :: Float
    , info :: a
    }

instance Functor Employee where
    fmap f empl = empl { info = f (info empl) }

forgetInfo :: Employee a -> Employee ()
forgetInfo = fmap (\_ -> ())

main :: IO ()
main = do
    let employee = Employee "Charles" "Hoskinson" 1000.0 True
    putStrLn $ "Original salary: " ++ show (salary employee)
    
    let newEmployee = forgetInfo employee
    putStrLn $ "Modified info: " ++ show (info newEmployee)
