import PairParser
import Utils

obsoletePair :: (Range, Range) -> Bool
obsoletePair _ = False

countObsoletePairs :: [(Range, Range)] -> Int
countObsoletePairs = length . filter (obsoletePair)

main = 
  do
    input <- getContents
    case parsePairs input of
      Left err -> do print err
      Right pairRanges -> do print (countObsoletePairs pairRanges)