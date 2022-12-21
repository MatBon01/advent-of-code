module Utils where
type Crate = Char

-- This tells the program to move how many crates from which stack to which stack
-- (Number, OriginStack, DestinationStack)
-- Stacks are numbered starting from 1
type Instruction = (Int, Int, Int)