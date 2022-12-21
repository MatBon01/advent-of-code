module Utils where

data File = Directory String | File String Int deriving(Show)
data Command = Cd File | Ls [File] deriving(Show)