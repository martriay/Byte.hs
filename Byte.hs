module Byte (byte, rightB, leftB, andB, orB, xorB, reverseB) where

import Bit

data Byte = By Bit Bit Bit Bit Bit Bit Bit Bit deriving (Eq, Ord, Show)

byte :: Int -> Int -> Int ->  Int ->  Int ->  Int ->  Int ->  Int -> Byte
byte a b c d e f g h = By (bit a) (bit b) (bit c) (bit d) (bit e) (bit f) (bit g) (bit h)

notB :: Byte -> Byte
notB (By a b c d e f g h) = By (neg a) (neg b) (neg c) (neg d) (neg e) (neg f) (neg g) (neg h)

andB :: Byte -> Byte -> Byte
andB = operatorB (\x y -> x + y == 2)

orB :: Byte -> Byte -> Byte
orB = operatorB (\x y -> x + y > 0)

xorB :: Byte -> Byte -> Byte
xorB = operatorB (\x y -> x + y == 1)

rightB :: Byte -> Byte
rightB (By a b c d e f g h) = By (bit 0) a b c d e f g

leftB :: Byte -> Byte
leftB (By a b c d e f g h) = By b c d e f g h (bit 0)

reverseB :: Byte -> Byte
reverseB (By a b c d e f g h) = By h g f e d c b a

operatorB :: (Int -> Int -> Bool) -> Byte -> Byte -> Byte
operatorB condition (By a b c d e f g h) (By a2 b2 c2 d2 e2 f2 g2 h2) =
  By (op a a2) (op b b2) (op c c2) (op d d2) (op e e2) (op f f2) (op g g2) (op h h2)
  where op x y
          | condition (tib x) (tib y) = bit 1
          | otherwise = bit 0
