main :: IO ()
main = do
    let failedBefore = True
    let message = if failedBefore
        then "If you have to fail again, fail better than you did before."
        else "You haven't failed before, so give it your best shot!"
    putStrLn message
