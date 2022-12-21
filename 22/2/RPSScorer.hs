import RPSParser

main = 
  do 
    input <- getContents
    case parseGame input of
        Left err -> do print err
        Right result -> do print result