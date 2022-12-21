import PairParser
import Utils

obsoletePair :: (Range, Range) -> Bool
obsoletePair (left, right) = right `include` left || left `include` right
  where
    include :: Range -> Range -> Bool
    include (outerLower, outerUpper) (innerLower, innerUpper) = 
      outerLower <= innerLower && outerUpper >= innerUpper

countObsoletePairs :: [(Range, Range)] -> Int
countObsoletePairs = length . filter obsoletePair

main = 
  do
    input <- getContents
    case parsePairs input of
      Left err -> do print err
      Right pairRanges -> do print (countObsoletePairs pairRanges)