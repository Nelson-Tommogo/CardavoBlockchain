import Text.Parsec
import Text.Parsec.String
import Control.Monad (void)

-- Parse an integer
integerParser :: Parser Integer
integerParser = do
    sign <- option 1 (char '-' >> return (-1))
    num <- read <$> many1 digit
    return (sign * num)

main :: IO ()
main = do
    putStrLn "Enter an integer:"
    input <- getLine
    case parse integerParser "" input of
        Left err -> putStrLn $ "Error: " ++ show err
        Right result -> putStrLn $ "Parsed integer: " ++ show result
