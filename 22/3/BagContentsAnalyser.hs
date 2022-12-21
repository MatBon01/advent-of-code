import BagContentsParser
import Utils

duplicateItemPrioritySum :: [([Item], [Item])] -> Int
duplicateItemPrioritySum _ = 0

main = 
  do
    input <- getContents
    case parseBags input of
      Left err -> do print err
      Right contents -> do print (duplicateItemPrioritySum contents)