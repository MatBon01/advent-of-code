import RPSParser1
import Utils

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


outcomeScore :: Outcome -> Int
outcomeScore Win = 6
outcomeScore Draw = 3
outcomeScore Lose = 0

calculateScore :: [(Move, Move)] -> Int
calculateScore ((m1,m2) : otherRounds) =
  shapeScore m2 + outcomeScore (calculateResult m1 m2) + calculateScore otherRounds
calculateScore [] = 0

main = 
  do 
    input <- getContents
    case parseGame input of
        Left err -> do print err
        Right result -> do print (calculateScore result)