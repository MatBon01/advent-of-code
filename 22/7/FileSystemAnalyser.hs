import FileSystemParser
import Utils
import Data.Maybe

createFileSystemTree :: [Command] -> File
-- Placeholder as list of commands cannot be empty --
createFileSystemTree [] = File 0
createFileSystemTree commands = createFileSystemTree' commands [Directory [("/", (Directory []))]]
  where
    createFileSystemTree' :: [Command] -> [File] -> File
    createFileSystemTree' [] files = last files
    createFileSystemTree' ((Cd (DirectoryEntry name)):commands) files
      | name == ".." = createFileSystemTree' commands (tail files)
      | otherwise    = createFileSystemTree' commands (fromJust (lookup name children) : files)
      where
        Directory children = head files
    createFileSystemTree' ((Ls ((DirectoryEntry name):fs)):commands) ((Directory children):files) =
      createFileSystemTree' (Ls fs:commands) (Directory ((name, Directory []):children):files)

    createFileSystemTree' ((Ls ((FileEntry name size):fs)):commands) ((Directory children):files) =
      createFileSystemTree' (Ls fs:commands) (Directory ((name, File size):children):files)

    createFileSystemTree' ((Ls []):commands) files = createFileSystemTree' commands files

main = 
  do
    input <- getContents
    case parseFileSystem input of
      Left err -> do print err
      Right result -> do print (createFileSystemTree result)

