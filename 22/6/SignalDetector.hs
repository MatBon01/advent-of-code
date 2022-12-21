getStartOfPacketMarker :: String -> Int
getStartOfPacketMarker input = getStartOfPacketMarker' input 0 Nothing Nothing Nothing Nothing
  where
    getStartOfPacketMarker' :: String -> Int -> Maybe Char -> Maybe Char -> Maybe Char -> Maybe Char -> Int
    getStartOfPacketMarker' [] n _ _ _ _ = n
    getStartOfPacketMarker' (c:str) n Nothing c1 c2 c3 = getStartOfPacketMarker' str (n + 1) c1 c2 c3 (Just c)
    getStartOfPacketMarker' (c:str) n (Just c4) (Just c3) (Just c2) (Just c1)
      | allDifferent packetMarker = n
      | otherwise                 = getStartOfPacketMarker' str (n + 1) (Just c3) (Just c2) (Just c1) (Just c)
      where
        packetMarker = [c4, c3, c2, c1]
        allDifferent [] = True
        allDifferent (x:[]) = True
        allDifferent (x:xs) = not (elem x xs) && allDifferent xs


main =
  do
    input <- getLine
    print (getStartOfPacketMarker input)