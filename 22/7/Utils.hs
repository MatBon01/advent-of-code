module Utils where

data FileEntry = DirectoryEntry String | FileEntry String Int deriving(Show)
data Command = Cd FileEntry | Ls [FileEntry] deriving(Show)
data File = Directory [(String, File)] | File Int deriving(Show)