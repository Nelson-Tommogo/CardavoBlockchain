import System.IO

main :: IO ()
main = do
    let filePath = "//home/common/Downloads/style.css"  -- Replace this with the actual path
    withFile filePath ReadMode $ \handle -> do
        contents <- hGetContents handle
        putStrLn contents
    -- File is automatically closed after this point
