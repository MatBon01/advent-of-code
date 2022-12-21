module Utils where

data MonkeyType = Name String | Human deriving(Show, Eq)
-- Eq has alternative for what it would have been --
data Monkey = Val Int | Add MonkeyType MonkeyType | Mult MonkeyType MonkeyType | Sub MonkeyType MonkeyType | Div MonkeyType MonkeyType | Eq Monkey deriving(Show)