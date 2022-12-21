import Utils
import Text.ParserCombinators.Parsec
import Data.Maybe

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
crateLevel = return []

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
    originCrateIndex <- (read <$> many1 digit) - 1
    destinationCrateIndex <- (read <$> many1 digit) - 1
    char '\n'
    return (numToMove, originCrateIndex, destinationCrateIndex)