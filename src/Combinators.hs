module Combinators where

s f g x = f x (g x) -- S-combinator
identity x = x -- I-combinator
constant x y = y -- K -combinator
