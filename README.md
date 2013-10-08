Byte.hs
=======

Byte type and bitwise operations in haskell. Includes the following operations: `andB`, `orB`, `xorB`, `reverseB`, `rightB` and `leftB`.

```haskell
Prelude> :l Byte.hs 
[1 of 2] Compiling Bit              ( Bit.hs, interpreted )
[2 of 2] Compiling Byte             ( Byte.hs, interpreted )
Ok, modules loaded: Byte, Bit.
*Byte> byte 1 1 1 1 0 0 0 0
By U U U U C C C C
*Byte> let a = byte 1 1 1 1 0 0 0 0
*Byte> let b = byte 0 0 0 1 0 0 0 1
*Byte> xorB b a
By U U U C C C C U
*Byte> orB a a
By U U U U C C C C
*Byte> rightB a
By C U U U U C C C
*Byte> reverseB b
By U C C C U C C C
```
