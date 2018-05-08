module ChurchNum (
  zero, -- point free
  one,  -- point free
  two,  -- point free
  inc,  -- point free
  dec ,
  add,
  sub,
  mul,  -- point free
  church,
  unchurch,-- point free
  isZero
) where

import           Base

-- zero :: p2 -> t3 -> t3
zero = Base.flip constant

-- one :: (t1 -> t2) -> t1 -> t2
one = apply

-- two :: (t -> t) -> t -> t
two x y = x $ x y

-- inc :: Num a => a -> a
inc = (+1)

-- dec :: Num a => a -> a
dec x = x - 1

-- add :: Num a => a -> a -> a
add = (+)

-- sub :: Num a => a -> a -> a
sub = (-)

-- mult :: Num a => a -> a -> a
mul a b = church a (+b) 0

-- church :: (Eq t1, Num t1) => t1 -> (t2 -> t2) -> t2 -> t2
church 0 = zero
church n = \f x -> f $ church (n -1 ) f x

-- unchurch :: ((Integer -> Integer) -> Integer -> t3) -> t3
unchurch = Base.flip ($ (1 +)) 0

-- isZero :: (Eq a, Num a) => a -> Bool
isZero = (==) 0
