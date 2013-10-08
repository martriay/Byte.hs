module Byte (newB, rightB, leftB, andB, orB, xorB) where

data Bit = Bi Int deriving (Eq, Ord, Show)

data Byte = By Bit Bit Bit Bit Bit Bit Bit Bit deriving (Eq, Ord, Show)

newB :: Int -> Int -> Int ->  Int ->  Int ->  Int ->  Int ->  Int -> Byte
newB a b c d e f g h
  | all isBit [a,b,c,d,e,f,g,h] = By (Bi a) (Bi b) (Bi c) (Bi d) (Bi e) (Bi f) (Bi g) (Bi h)
  | otherwise = error "Invalid bits"
  where isBit x = elem x [0,1]

rightB :: Byte -> Byte
rightB (By a b c d e f g h) = By (Bi 0) a b c d e f g

leftB :: Byte -> Byte
leftB (By a b c d e f g h) = By b c d e f g h (Bi 0)

andB :: Byte -> Byte -> Byte
andB = operatorB (\x y -> x + y == 2)

orB :: Byte -> Byte -> Byte
orB = operatorB (\x y -> x + y > 0)

xorB :: Byte -> Byte -> Byte
xorB = operatorB (\x y -> x + y == 1)

operatorB :: (Int -> Int -> Bool) -> Byte -> Byte -> Byte
operatorB condition (By a b c d e f g h) (By a2 b2 c2 d2 e2 f2 g2 h2) =
  By (op a a2) (op b b2) (op c c2) (op d d2) (op e e2) (op f f2) (op g g2) (op h h2)
  where op (Bi x) (Bi y)
          | condition x y = Bi 1
          | otherwise = Bi 0
