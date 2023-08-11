import System.IO

main :: IO ()
main = do
    let filePath = "//home/common/Downloads/style.css"  
    withFile filePath ReadMode $ \handle -> do
        contents <- hGetContents handle
        putStrLn contents
