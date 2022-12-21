import FileSystemParser
import Utils

main = 
  do
    input <- getContents
    case parseFileSystem input of
      Left err -> do print err
      Right result -> do print result

