module MonkeyParser where
import Text.ParserCombinators.Parsec
import Utils
import Data.Functor.Classes (eq2)

monkeys :: GenParser Char st [(MonkeyType, Monkey)]
monkeys =
  do
    many monkey

monkey :: GenParser Char st (MonkeyType, Monkey)
monkey = try rootMonkey <|> normalMonkey

normalMonkey :: GenParser Char st (MonkeyType, Monkey)
normalMonkey =
  do
    name <- many (noneOf ":")
    string ": "
    monkey <- monkeyOperations
    char '\n'
    return ((Name name), monkey)

monkeyOperations :: GenParser Char st Monkey
monkeyOperations = try add <|> try sub <|> try mult <|> try MonkeyParser.div <|> try val

rootMonkey :: GenParser Char st (MonkeyType, Monkey)
rootMonkey =
  do
    name <- string "root"
    string ": "
    monkey <- eq
    char '\n'
    return ((Name name), monkey)

eq :: GenParser Char st Monkey
eq =
  do
    monkey <- monkeyOperations
    return (Eq monkey)

val :: GenParser Char st Monkey
val =
  do
    num <- read <$> many1 digit
    return (Val num)

name :: GenParser Char st MonkeyType
name =
  do
    name <- many1 (noneOf "\n ")
    return (Name name)

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

parseMonkeys :: String -> Either ParseError [(MonkeyType, Monkey)]
parseMonkeys = parse monkeys "(unknown)"
