data Tree leaf a | Node (Tree a) (Tree a)
deriving Show

label :: Tree -> Tree (Int, a)
label = snd . label' 1

label'  :: Int -> Tree a -> (Int, Tree(Int a))
label' nextLabel (leaf a) = (nextLabel +1, leaf(nextLabel))