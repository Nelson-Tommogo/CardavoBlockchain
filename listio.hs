import Text.Printf (printf)

-- Calculate sum of a list of numbers
calculateSum :: [Int] -> Int
calculateSum = sum

-- Calculate average of a list of numbers
calculateAverage :: [Int] -> Double
calculateAverage marks = fromIntegral (sum marks) / fromIntegral (length marks)

-- Calculate grade based on average
calculateGrade :: Double -> String
calculateGrade average
    | average >= 90 = "A"
    | average >= 80 = "B"
    | average >= 70 = "C"
    | average >= 60 = "D"
    | otherwise      = "F"

main :: IO ()
main = do
    putStrLn "Enter marks (separated by spaces):"
    input <- getLine
    let marks = map read $ words input :: [Int]
    let sumOfMarks = calculateSum marks
    let averageOfMarks = calculateAverage marks
    let grade = calculateGrade averageOfMarks
    
    putStrLn "Results:"
    putStrLn $ "Marks: " ++ show marks
    putStrLn $ "Sum: " ++ show sumOfMarks
    putStrLn $ "Average: " ++ printf "%.2f" averageOfMarks
    putStrLn $ "Grade: " ++ grade
