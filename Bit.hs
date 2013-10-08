module Bit (Bit, bit, tib) where

data Bit = C | U deriving (Eq, Ord, Show)

bit :: Int -> Bit
bit i
  | i == 0 = C
  | i == 1 = U
  | otherwise = error "Invalid Bit"

tib :: Bit -> Int
tib C = 0
tib U = 1
