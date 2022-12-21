import BagContentsParser
import Utils
import Data.Char

getDuplicateItem :: ([Item], [Item]) -> Item
getDuplicateItem (c1, c2) = head (filter (`elem` c1) c2)

getPriority :: Item -> Int
getPriority c
  | isLower c  = ord c - ord 'a' + 1
  | isUpper c  = ord c - ord 'A' + (ord 'z' - ord 'a' + 1) + 1
  | otherwise  = 0

duplicateItemPrioritySum :: [([Item], [Item])] -> Int
duplicateItemPrioritySum = sum . map (getPriority . getDuplicateItem)

main = 
  do
    input <- getContents
    case parseBags input of
      Left err -> do print err
      Right contents -> do print (duplicateItemPrioritySum contents)