module Tuple where

import           Base

constant' = Base.constant
flip' = Base.flip

-- tuple' :: t1 -> t2 -> (t1 -> t2 -> t3) -> t3
tuple' a b f = f a b

-- first' :: ((p1 -> p2 -> p1) -> b) -> b
first' = ($ constant')

-- second' :: ((p2 -> t3 -> t3) -> t) -> t
second' t = t $ flip' constant'

-- swap' :: ((p2 -> p2 -> p2) -> t1) -> (t1 -> t1 -> t2) -> t2
swap' t = tuple' (second' t) (first' t)

-- curry' :: (((t1 -> t2 -> t3) -> t3) -> t4) -> t1 -> t2 -> t4
curry' f = f $ tuple'

-- t1 -> (t1 -> t2) -> t2
uncurry' f t = t f
