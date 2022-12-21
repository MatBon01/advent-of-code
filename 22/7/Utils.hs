module Utils where

data File = Directory String | File String Int
data Command = Cd File | Ls [File]