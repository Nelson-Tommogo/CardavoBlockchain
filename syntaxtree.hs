import Data.Tree

-- Data type to represent arithmetic expressions
data Expr = Lit Int
          | Add Expr Expr
          | Sub Expr Expr
          | Mul Expr Expr
          | Div Expr Expr
          deriving Show

-- Function to convert an Expr into a syntax tree
toSyntaxTree :: Expr -> Tree String
toSyntaxTree (Lit n) = Node (show n) []
toSyntaxTree (Add e1 e2) = Node "+" [toSyntaxTree e1, toSyntaxTree e2]
toSyntaxTree (Sub e1 e2) = Node "-" [toSyntaxTree e1, toSyntaxTree e2]
toSyntaxTree (Mul e1 e2) = Node "*" [toSyntaxTree e1, toSyntaxTree e2]
toSyntaxTree (Div e1 e2) = Node "/" [toSyntaxTree e1, toSyntaxTree e2]

-- Example expression: (3 + 2) * 4
expr :: Expr
expr = Mul (Add (Lit 3) (Lit 2)) (Lit 4)

main :: IO ()
main = print (toSyntaxTree expr)
