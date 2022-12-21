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

bagSecurityGroups :: GenParser Char st [([Item], [Item], [Item])]
bagSecurityGroups = many bagSecurityGroup

-- Quesiton specified that there are three elves per group --
bagSecurityGroup :: GenParser Char st ([Item], [Item], [Item])
bagSecurityGroup = 
  do
    elf1 <- bagContent
    elf2 <- bagContent
    elf3 <- bagContent
    return (elf1, elf2, elf3)

parseBags :: String -> Either ParseError [([Item], [Item])]
parseBags = parse bagsContent "(unknown)" 

parseBagSecurityGroups :: String -> Either ParseError [([Item], [Item], [Item])]
parseBagSecurityGroups = parse bagSecurityGroups "(unknown)"