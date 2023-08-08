-- Defining boolean values
myTrue :: Bool
myTrue = True

myFalse :: Bool
myFalse = False

-- Using boolean values in functions
isEven :: Int -> Bool
isEven n = n `mod` 2 == 0

isOdd :: Int -> Bool
isOdd n = not (isEven n)

-- Combining boolean values using logical operators
andExample :: Bool
andExample = True && False

orExample :: Bool
orExample = True || False

notExample :: Bool
notExample = not True
