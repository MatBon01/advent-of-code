module Utils where

data File = Directory String | File String Int
data Command = Cd String | Ls [File]