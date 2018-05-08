{-# LANGUAGE NoImplicitPrelude #-}
module Base (
  identity,
  constant,
  apply,
  compose,
  flip
) where

-- | Identity function.
-- id :: a -> a
-- identity = \x -> x
identity x = x

-- | Constant function.
-- const :: a -> b -> a
-- constant = \x y -> x
constant x y = x

-- apply :: (t1 -> t2) -> t1 -> t2
-- apply = \f x -> f x
apply f x = f x

-- compose :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2
-- compose = \x y z -> x ( y (z))
compose x y z = x ( y ( z ) )

-- flip :: (a -> b -> c) -> b -> a -> c
-- flip = \f x y -> f y x
flip f x y = f y x
