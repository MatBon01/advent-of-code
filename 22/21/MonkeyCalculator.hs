import Utils
import MonkeyParser

main =
  do
    input <- getContents
    case parseMonkeys input of
      Left err -> do print err
      Right result -> do print result