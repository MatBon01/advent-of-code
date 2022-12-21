import Utils
import MonkeyParser
import Data.Maybe

calculateMonkey :: [(MonkeyType, Monkey)] -> Monkey -> Int
calculateMonkey monkeys (Val num) = num
calculateMonkey monkeys (Add m1 m2) = calculateMonkeyOp monkeys m1 m2 (+)
calculateMonkey monkeys (Sub m1 m2) = calculateMonkeyOp monkeys m1 m2 (-)
calculateMonkey monkeys (Mult m1 m2) = calculateMonkeyOp monkeys m1 m2 (*)
calculateMonkey monkeys (Div m1 m2) = calculateMonkeyOp monkeys m1 m2 Prelude.div
calculateMonkey monkeys (Eq monkey) = calculateMonkey monkeys monkey

calculateMonkeyOp :: [(MonkeyType, Monkey)] -> MonkeyType -> MonkeyType -> (Int -> Int -> Int) -> Int
calculateMonkeyOp monkeys m1 m2 op = calculateMonkey monkeys m1' `op` calculateMonkey monkeys m2'
  where
    m1' = fromJust (lookup m1 monkeys)
    m2' = fromJust (lookup m2 monkeys)

main =
  do
    input <- getContents
    case parseMonkeys input of
      Left err -> do print err
      Right monkeys -> do print monkeys ; print (calculateMonkey monkeys (fromJust (lookup (Name "root") monkeys)))