import Utils
import Text.ParserCombinators.Parsec

pairList :: GenParser Char st [(Range, Range)]
pairList = 
  do
    many pair

pair :: GenParser Char st (Range, Range)
pair = 
  do
    r1 <- cleaningRange
    char ','
    r2 <- cleaningRange
    char '\n'
    return (r1, r2)

cleaningRange :: GenParser Char st Range
cleaningRange = 
  do
    lower <- many (noneOf "-")
    char '-'
    upper <- many (noneOf ",\n")
    return (read lower, read upper)


parsePairs :: String -> Either ParseError [(Range, Range)]
parsePairs = parse pairList "(unknown)"

main =
  do
    input <- getContents
    case parsePairs input of
      Left err -> do print err
      Right pairs -> do print pairs