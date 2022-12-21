import RPSParser1

data Outcome = Win | Draw | Lose deriving(Eq, Show)

shapeScore :: Move -> Int
shapeScore Rock = 1
shapeScore Paper = 2
shapeScore Scissors = 3

-- Second player is you --
calculateResult :: Move -> Move -> Outcome
calculateResult Scissors Rock = Win
calculateResult Rock Paper = Win
calculateResult Paper Scissors = Win
calculateResult m1 m2 
  | m1 == m2 = Draw
  | otherwise = Lose


outcomeScore :: Move -> Move -> Int
outcomeScore m1 m2 
  | result == Win = 6
  | result == Draw = 3
  | result == Lose = 0
  where
    result = calculateResult m1 m2

calculateScore :: [(Move, Move)] -> Int
calculateScore ((m1,m2) : otherRounds) =
  shapeScore m2 + outcomeScore m1 m2 + calculateScore otherRounds
calculateScore [] = 0

main = 
  do 
    input <- getContents
    case parseGame input of
        Left err -> do print err
        Right result -> do print (calculateScore result)