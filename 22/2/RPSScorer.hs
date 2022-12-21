import RPSParser
import Utils

calculateScore :: [(Move, Outcome)] -> Int
calculateScore strategy = 0

main =
  do
    input <- getContents
    case parseStrategy input of
        Left err -> do print err
        Right result -> do print (calculateScore result)

