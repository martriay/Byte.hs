module Bit (Bit, bit, tib, neg) where

data Bit = C | U deriving (Eq, Ord, Show)

bit :: Int -> Bit
bit 0 = C
bit 1 = U
bit _ = error "Invalid Bit"

tib :: Bit -> Int
tib C = 0
tib U = 1

neg :: Bit -> Bit
neg U = C
neg C = U
