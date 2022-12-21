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

overlap :: (Range, Range) -> Bool
overlap ((l1, u1), (l2, u2)) = firstUpper >= secondLower
  where
    (firstUpper, secondLower) = if l1 < l2 then (u1, l2) else (u2, l1)

countOverlappingPairs :: [(Range, Range)] -> Int
countOverlappingPairs = length . filter overlap

main = 
  do
    input <- getContents
    case parsePairs input of
      Left err -> do print err
      Right pairRanges -> do print (countOverlappingPairs pairRanges)