import Text.Parsec
import Text.Parsec.String

-- Parse a string enclosed in double quotes
stringLiteral :: Parser String
stringLiteral = do
    char '"'
    content <- many (noneOf "\"")
    char '"'
    return content

-- Parse two string literals separated by a space
combinedStrings :: Parser String
combinedStrings = do
    first <- stringLiteral
    spaces
    second <- stringLiteral
    return (first ++ " " ++ second)

instance Alternative Parser where
    empty :: parse a
    empty= Parser $ const []
    

main :: IO ()
main = do
    putStrLn "Enter two strings separated by a space:"
    input <- getLine
    case parse combinedStrings "" input of
        Left err -> putStrLn $ "Error: " ++ show err
        Right result -> putStrLn $ "Combined result: " ++ result
