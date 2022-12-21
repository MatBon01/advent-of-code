module RPSParser where
-- Not finished researching parsec library but using it to practice fundamentals --
import Text.ParserCombinators.Parsec
import GHC.IO.BufferedIO (readBufNonBlocking)

data Move = Rock | Paper | Scissors deriving(Show) -- TODO:: check this derivation --

strategyGuide :: GenParser Char st [(Move, Move)]
strategyGuide = 
  do result <- many gameRound
     eof
     return result

gameRound :: GenParser Char st (Move, Move)
gameRound =
  do move1 <- move
     char ' '
     move2 <- move
     char '\n'
     return (move1, move2)

move :: GenParser Char st Move
move = 
  rock <|> paper <|> scissors

rock :: GenParser Char st Move
rock = 
  (char 'A' <|> char 'X') >> return Rock

paper :: GenParser Char st Move
paper = 
  (char 'B' <|> char 'Y') >> return Paper

scissors :: GenParser Char st Move
scissors = 
  (char 'C' <|> char 'Z') >> return Scissors
  
parseGame :: String -> Either ParseError [(Move, Move)]
parseGame input = parse strategyGuide "(unknown)" input