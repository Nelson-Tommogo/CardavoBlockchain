main :: IO ()
main = do
    putStrLn "Please enter your name:"
    name <- getLine
    putStrLn ("Hello, " ++ name ++ "! Welcome to Haskell!")

    putStrLn "What's your email address?"
    email <- getLine
    putStrLn ("Hello, " ++ email ++ "! Welcome to Haskell!")

    putStrLn "What's your qualification?"
    qualification <- getLine
    putStrLn ("Hello, " ++ qualification ++ "! Welcome to Haskell!")

    putStrLn "What's your stack?"
    stack <- getLine
    putStrLn ("Hello, " ++ stack ++ "! Welcome to Haskell!")
