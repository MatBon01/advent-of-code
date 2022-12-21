import BagContentsParser
import Utils

getDuplicateItem :: ([Item], [Item]) -> Item
getDuplicateItem _ = 'a'

getPriority :: Item -> Int
getPriority _ = 0

duplicateItemPrioritySum :: [([Item], [Item])] -> Int
duplicateItemPrioritySum = sum . map (getPriority . getDuplicateItem)

main = 
  do
    input <- getContents
    case parseBags input of
      Left err -> do print err
      Right contents -> do print (duplicateItemPrioritySum contents)