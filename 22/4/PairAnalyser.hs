import PairParser
import Utils

countObsoletePairs :: [(Range, Range)] -> Int
countObsoletePairs _ = 0

main = 
  do
    input <- getContents
    case parsePairs input of
      Left err -> do print err
      Right pairRanges -> do print (countObsoletePairs pairRanges)