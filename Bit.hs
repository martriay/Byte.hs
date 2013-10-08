module Bit (Bit, bit, tib) where

data Bit = C | U deriving (Eq, Ord, Show)

bit :: Int -> Bit
bit 0 = C
bit 1 = U
bit n = error "Invalid Bit"

tib :: Bit -> Int
tib C = 0
tib U = 1
