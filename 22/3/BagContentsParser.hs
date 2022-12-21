module BagContentsParser where 
import Text.ParserCombinators.Parsec
import Utils
import Data.ByteString (split, length)

bagsContent :: GenParser Char st [([Item], [Item])]
bagsContent = 
  do 
    bags <- many bag
    eof
    return bags

bag :: GenParser Char st ([Item], [Item])
bag =
  do
    content <- bagContent
    return (splitAt (Prelude.length content `div` 2) content)

bagContent :: GenParser Char st [Item]
bagContent = 
  do
    contents <- many (noneOf "\n")
    char '\n'
    return contents

parseBags :: String -> Either ParseError [([Item], [Item])]
parseBags = parse bagsContent "(unknown)" 