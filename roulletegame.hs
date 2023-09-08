-- | W2.1 Roulette
module W0201
    ( -- * Color
      Color (..)
      -- * Subtask W2.1.1
    , roulette
      -- * Subtask W2.1.2
    , histogram
      -- * Subtask W2.1.3
    , gamblersRuin
    ) where

import           Data.Map      (Map)
import           System.Random
import Data.Map (fromListWith, toList)
-- Define the Color data type
data Color = Zero | Red | Black
    deriving (Show, Read, Eq, Ord, Bounded, Enum)
    -- Simulates a spin of the roulette wheel and returns the resulting color.
roulette :: IO Color
roulette = do
    randomValue <- randomRIO (0, 36) :: IO Int
    return $ case randomValue of
        0 -> Zero
        _ | even randomValue -> Black
          | odd randomValue -> Red

-- Subtask W2.1.1

roulette :: IO Color
roulette = error "TODO: implement roulette"
-- | Generates a histogram of the colors obtained from a given number of roulette spins.
histogram :: Int -> IO (Map Color Int)
histogram n = do
  -- Generate a list of outcomes by simulating roulette n times
  results <- sequence (replicate n roulette)
  -- Create a frequency map of the outcomes
  let counts = fromListWith (+) [(c, 1) | c <- results]
  return counts

-- Subtask W2.1.2

-- |
-- >>> histogram 0
-- fromList []
--
histogram :: Int -> IO (Map Color Int)
histogram = error "TODO: implement histogram"
histogram n = do
    results <- sequence (replicate n roulette)
    let counts = fromListWith (+) [(c, 1) | c <- results]
    return counts

-- Subtask W2.1.3

-- |
-- >>> gamblersRuin 0
-- 0
--
gamblersRuin :: Int -> IO Int
gamblersRuin = error "TODO: implement gamblersRuin"
