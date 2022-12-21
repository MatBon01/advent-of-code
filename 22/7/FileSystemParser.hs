module FileSystemParser where
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
    return (Cd (DirectoryEntry directory))

ls :: GenParser Char st Command
ls = 
  do
    string "ls\n"
    children <- many child
    return (Ls children)

child :: GenParser Char st FileEntry 
child = directory <|> file

directory :: GenParser Char st FileEntry
directory =
  do
    string "dir "
    name <- many (noneOf "\n")
    char '\n'
    return (DirectoryEntry name)

file :: GenParser Char st FileEntry
file =
  do
    size <- read <$> many1 digit
    char ' '
    name <- many (noneOf "\n")
    char '\n'
    return (FileEntry name size)

parseFileSystem :: String -> Either ParseError [Command]
parseFileSystem = parse fileSystemCommands "(unknown)"