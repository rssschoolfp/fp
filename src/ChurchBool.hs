module ChurchBool  where
import           Base
import           ChurchNum

-- true :: p1 -> p2 -> p1
true a b = a

-- false :: p1 -> p2 -> p2
false a b = b

-- cond :: (t1 -> t2 -> t3) -> t1 -> t2 -> t3
-- cond = identity
cond a b c = a b c

-- ((p2 -> p1 -> p3 -> p3) -> (p4 -> p5 -> p4) -> t) -> t
isZero n = n (Base.constant false) true

-- toNum :: (((t1 -> t2) -> t1 -> t2) -> (p2 -> t3 -> t3) -> t) -> t
toChurchNum x  = x one zero
-- unchurch $ toChurchNum $ ChurchBool.isZero zero

-- (t1 -> (p1 -> p2 -> p2) -> t2)
  -- -> ((p3 -> p4 -> p3) -> (p5 -> p6 -> p6) -> t1) -> t2
and' a b = cond a (cond b true false) false

-- ((p1 -> p2 -> p1) -> t1 -> t2)
-- -> ((p3 -> p4 -> p3) -> (p5 -> p6 -> p6) -> t1) -> t2
or' a b = cond a true (cond b true false)

-- not' :: ((p1 -> p2 -> p2) -> (p3 -> p4 -> p3) -> t) -> t
not' a = cond a false true
