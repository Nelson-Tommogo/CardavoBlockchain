myname :: (String, String, String)
myname = ("Nelson", "Ochieng", "Tommogo")
countryschool :: (String, String)
countryschool = ("Kenya", "Kca University")

firstElement :: String
firstElement = case myname of
    (x, _, _) -> x

secondElement :: String
secondElement = case myname of
    (_, y, _) -> y

thirdElement :: String
thirdElement = case myname of
    (_, _, z) -> z

country :: String
country = fst countryschool

school :: String
school = snd countryschool  

main :: IO()
main = do
    putStrLn $ "First element of myname: " ++ show firstElement
    putStrLn $ "Second element of myname: " ++ secondElement
    putStrLn $ "Third element of myname: " ++ thirdElement
    putStrLn $ "Country: " ++ country
    putStrLn $ "School: " ++ school
