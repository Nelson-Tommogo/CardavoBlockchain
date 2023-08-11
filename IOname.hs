main :: IO ()
main = do
    putStrLn "Please enter your first name:"
    firstName <- getLine
    putStrLn "Please enter your last name:"
    lastName <- getLine

    let fullName = firstName ++ lastName
    putStrLn ("Joined name: " ++ fullName)
