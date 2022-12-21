import Utils
import Text.ParserCombinators.Parsec
import Data.Maybe
import Distribution.PackageDescription (TestSuiteInterface)

-- Returns the initial crane configuration and list of instructions
craneOperations :: GenParser Char st ([[Crate]], [Instruction])
craneOperations = 
  do
    initialConfiguration <- crates
    char '\n'
    rearrangementProcedure <- instructions
    eof
    return (initialConfiguration, rearrangementProcedure)

crates :: GenParser Char st [[Crate]]
crates =
  do
    cratesOnLevel <- many crateLevel
    return (organiseLevels cratesOnLevel)
    where
      organiseLevels :: [[Maybe Crate]] -> [[Crate]]
      -- TODO:: fix this --
      organiseLevels = map (map (fromMaybe 'a'))

crateLevel :: GenParser Char st [Maybe Crate]
crateLevel =
  do
    try crateNames <|> sepBy (crate <|> noCrate) (char ' ')

crate :: GenParser Char st (Maybe Crate)
crate =
  do
    char '['
    crate <- anyChar
    char ']'
    return (Just crate)

noCrate :: GenParser Char st (Maybe Crate)
noCrate =
  do
    string "   "
    return Nothing

crateNames :: GenParser Char st [Maybe Crate]
crateNames =
  do
    sepBy (char ' ' >> many1 digit >> char ' ') (char ' ')
    return []

instructions :: GenParser Char st [Instruction]
instructions = 
  do
    many instruction

instruction :: GenParser Char st Instruction
instruction = 
  do
    string "move "
    numToMove <- read <$> many1 digit
    string " from "
    originCrate <- read <$> many1 digit
    destinationCrate <- read <$> many1 digit
    char '\n'
    return (numToMove, originCrate - 1, destinationCrate - 1)