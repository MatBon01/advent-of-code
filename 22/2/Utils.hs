module Utils where

data Move = Rock | Paper | Scissors deriving(Eq, Show) -- TODO:: check this derivation --
data Outcome = Win | Draw | Lose deriving(Eq, Show)
