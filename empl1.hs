data Employee a = Employee
    { firstName :: String
    , lastName :: String
    , salary :: Float
    , info :: a
    }

instance Functor Employee where
    fmap f emp = emp { info = f (info emp) }

forgetInfo :: Employee a -> Employee ()
forgetInfo emp = fmap (\_ -> ()) emp

gatherInfo :: [Employee a] -> [a]
gatherInfo = map info

-- Example usage
main :: IO ()
main = do
    let employees = [ Employee "Charles" "Hoskinson" 1000.0 True
                    , Employee "Alejandro" "Garcia" 900.0 False
                    ]
    let infoList = gatherInfo employees
    putStrLn $ "Extracted info: " ++ show infoList
