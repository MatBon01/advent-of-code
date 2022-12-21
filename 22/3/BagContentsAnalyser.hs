import BagContentsParser
import Utils
import Data.Char

getDuplicateItems :: ([Item], [Item]) -> [Item]
getDuplicateItems (c1, c2) = filter (`elem` c1) c2

getDuplicateItem :: ([Item], [Item]) -> Item
getDuplicateItem = head . getDuplicateItems

getPriority :: Item -> Int
getPriority c
  | isLower c  = ord c - ord 'a' + 1
  | isUpper c  = ord c - ord 'A' + (ord 'z' - ord 'a' + 1) + 1
  | otherwise  = 0

duplicateItemPrioritySum :: [([Item], [Item])] -> Int
duplicateItemPrioritySum = sum . map (getPriority . getDuplicateItem)

getGroupBadge :: ([Item], [Item], [Item]) -> Item
getGroupBadge (e1, e2, e3) = getDuplicateItem (common, e3)
  where
    common = getDuplicateItems (e1, e2)

main = 
  do
    input <- getContents
    case parseBags input of
      Left err -> do print err
      Right contents -> do print (duplicateItemPrioritySum contents)