import RPSParser
import Utils
import RPSParser (parseStrategy)

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

determineYourMove :: Outcome -> Move -> Move
determineYourMove Draw m = m
determineYourMove Lose Rock = Scissors
determineYourMove Lose Paper = Rock
determineYourMove Lose Scissors = Paper
determineYourMove Win Rock = Paper
determineYourMove Win Paper = Scissors
determineYourMove Win Scissors = Rock

calculateScore :: [(Move, Outcome)] -> Int
calculateScore ((m,o) : otherRounds) =
  shapeScore yourMove + outcomeScore o + calculateScore otherRounds
  where
    yourMove = determineYourMove o m
calculateScore [] = 0

main = 
  do 
    input <- getContents
    case parseStrategy input of
        Left err -> do print err
        Right result -> do print (calculateScore result)