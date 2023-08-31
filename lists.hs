units :: [Int]
units = [68, 77, 78, 99, 59, 93, 91, 90]

totalMarksUnits :: [Int]
totalMarksUnits = [x + x + x + x + x + x + x + x | x <- units]

main :: IO ()
main = do
    putStrLn "Units:"
    print units
    
    putStrLn "Total Marks for Units:"
    print totalMarksUnits

