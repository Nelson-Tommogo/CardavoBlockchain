-- Define a Tree data type
data Tree a = Node a [Tree a]
  deriving Show

-- Create a sample tree:
--      1
--     /|\
--    2 3 4
--   /
--  5
sampleTree :: Tree Int
sampleTree =
    Node 1
        [ Node 2 [Node 5 []]
        , Node 3 []
        , Node 4 []
        ]

-- Main function
main :: IO ()
main = print sampleTree
