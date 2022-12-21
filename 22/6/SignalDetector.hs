allDifferent :: Eq a => [a] -> Bool
allDifferent [] = True
allDifferent (x : []) = True
allDifferent (x : xs) = not (elem x xs) && allDifferent xs

getStartOfPacketMarkerPosition4 :: String -> Int
getStartOfPacketMarkerPosition4 input = getStartOfPacketMarkerPosition4' input 0 Nothing Nothing Nothing Nothing
  where
    getStartOfPacketMarkerPosition4' :: String -> Int -> Maybe Char -> Maybe Char -> Maybe Char -> Maybe Char -> Int
    getStartOfPacketMarkerPosition4' [] n _ _ _ _ = n
    getStartOfPacketMarkerPosition4' (c:str) n Nothing c1 c2 c3 = getStartOfPacketMarkerPosition4' str (n + 1) c1 c2 c3 (Just c)
    getStartOfPacketMarkerPosition4' (c:str) n (Just c4) (Just c3) (Just c2) (Just c1)
      | allDifferent packetMarker = n
      | otherwise                 = getStartOfPacketMarkerPosition4' str (n + 1) (Just c3) (Just c2) (Just c1) (Just c)
      where
        packetMarker = [c4, c3, c2, c1]

-- Second int says how long the marker should be --
getStartOfPacketMarkerPosition :: Int -> String -> Int
getStartOfPacketMarkerPosition n input = getStartOfPacketMarkerPosition' input 0 []
  where
    -- Takes the remaining string, current position and marker candidate
    getStartOfPacketMarkerPosition' :: String -> Int -> [Char] -> Int
    getStartOfPacketMarkerPosition' [] currPos _ = currPos
    getStartOfPacketMarkerPosition' (c:str) currPos marker
      | allDifferent marker && length marker == n = currPos
      | otherwise                                 = getStartOfPacketMarkerPosition' str (currPos + 1) newMarker
      where

        newMarker = c : take (n - 1) marker




main =
  do
    input <- getLine
    print (getStartOfPacketMarkerPosition 14 input)