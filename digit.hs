import Data.Char (isDigit)

main :: IO ()
main = do
    putStrLn "Enter an input (type 'exit' to quit):"
    input <- getLine
    if input == "exit"
        then putStrLn "Program Exitted..."
        else do
            if all isDigit input
                then putStrLn "Input is a digit."
                else if all (`elem` ['a'..'z']) input
                    then putStrLn "Input is a string."
                    else if any isDigit input && any (`elem` ['a'..'z']) input
                        then putStrLn "Input is a combination of string and digit."
                        else putStrLn "Input is invalid."
            main 
