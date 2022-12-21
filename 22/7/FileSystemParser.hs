import Utils
import Text.ParserCombinators.Parsec

fileSystemCommands :: GenParser Char st [Command]
fileSystemCommands = 
  do
    many commandSegments

commandSegments :: GenParser Char st Command
commandSegments = 
  do
    string "$ "
    command

command :: GenParser Char st Command
command = cd <|> ls

cd :: GenParser Char st Command
cd = 
  do
    string "cd "
    directory <- many (noneOf "\n")
    char '\n'
    return (Cd (Directory directory))

ls :: GenParser Char st Command
ls = 
  do
    string "ls\n"
    children <- many child
    return (Ls children)

child :: GenParser Char st File 
child = directory <|> file

directory :: GenParser Char st File
directory =
  do
    string "dir "
    name <- many (noneOf "\n")
    return (Directory name)

file :: GenParser Char st File
file =
  do
    size <- read <$> many1 digit
    char ' '
    name <- many (noneOf "\n")
    char '\n'
    return (File name size)