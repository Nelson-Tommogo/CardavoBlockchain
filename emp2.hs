data Employee a = Employee
    { firstName :: String
    , lastName :: String
    , salary :: Float
    , info :: a
    }

gatherInfo :: [Employee a] -> [a]
gatherInfo = map info

data Rose a = Fork a [Rose a] deriving Show

roseToList :: Rose a -> [a]
roseToList (Fork x xs) = x : concatMap roseToList xs

main :: IO ()
main = do
    let employees = [ Employee "Charles" "Hoskinson" 1000.0 True
                    , Employee "Alejandro" "Garcia" 900.0 False
                    ]
    let infoList = gatherInfo employees
    putStrLn $ "Extracted info: " ++ show infoList

    let roseTree = Fork 'x' [Fork 'y' [], Fork 'z' []]
    putStrLn $ "Rose tree to list: " ++ roseToList roseTree
