import Text.ParserCombinators.Parsec
import Utils

monkeys :: GenParser Char st [(String, Monkey)]
monkeys =
  do
    many monkey

monkey :: GenParser Char st (String, Monkey)
monkey =
  do
    name <- many (noneOf ":")
    string ": "
    monkey <- (try add <|> try sub <|> try mult <|> try Main.div <|> try val)
    char '\n'
    return (name, monkey)

val :: GenParser Char st Monkey
val =
  do
    num <- read <$> many1 digit
    return (Val num)

name :: GenParser Char st String
name = many1 (noneOf "\n ")

add :: GenParser Char st Monkey
add =
  do
    name1 <- name
    string " + "
    name2 <- name
    return (Add name1 name2)

sub :: GenParser Char st Monkey
sub =
  do
    name1 <- name
    string " - "
    name2 <- name
    return (Sub name1 name2)

mult :: GenParser Char st Monkey
mult =
  do
    name1 <- name
    string " * "
    name2 <- name
    return (Mult name1 name2)

div :: GenParser Char st Monkey
div =
  do
    name1 <- name
    string " / "
    name2 <- name
    return (Div name1 name2)

parseMonkeys :: String -> Either ParseError [(String, Monkey)]
parseMonkeys = parse monkeys "(unknown)"

main =
  do
    input <- getContents
    case parseMonkeys input of
      Left err -> do print err
      Right result -> do print result
