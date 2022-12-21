module RPSParser where
import Utils
import Text.ParserCombinators.Parsec

strategyGuide :: GenParser Char st [(Move, Outcome)]
strategyGuide =
  do 
    result <- many gameStrategy
    eof
    return result

gameStrategy :: GenParser Char st (Move, Outcome)
gameStrategy =
  do
    move <- move
    char ' '
    outcome <- outcome
    char '\n'
    return (move, outcome)

move :: GenParser Char st Move
move =
  (char 'A' >> return Rock) <|> (char 'B' >> return Paper) <|> (char 'C' >> return Scissors)

outcome :: GenParser Char st Outcome
outcome =
  (char 'X' >> return Lose) <|> (char 'Y' >> return Draw) <|> (char 'Z' >> return Win)

parseStrategy :: String -> Either ParseError [(Move, Outcome)]
parseStrategy = parse strategyGuide "(unknown)"