import RPSParser

shapeScore :: Move -> Int
shapeScore Rock = 1
shapeScore Paper = 2
shapeScore Scissors = 3

calculateScore :: [(Move, Move)] -> Int
calculateScore ((m1,m2) : otherRounds) =
  shapeScore m2 + calculateScore otherRounds
calculateScore [] = 0

main = 
  do 
    input <- getContents
    case parseGame input of
        Left err -> do print err
        Right result -> do print (calculateScore result)