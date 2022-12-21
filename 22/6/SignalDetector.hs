getStartOfPacketMarker4 :: String -> Int
getStartOfPacketMarker4 input = getStartOfPacketMarker4' input 0 Nothing Nothing Nothing Nothing
  where
    getStartOfPacketMarker4' :: String -> Int -> Maybe Char -> Maybe Char -> Maybe Char -> Maybe Char -> Int
    getStartOfPacketMarker4' [] n _ _ _ _ = n
    getStartOfPacketMarker4' (c:str) n Nothing c1 c2 c3 = getStartOfPacketMarker4' str (n + 1) c1 c2 c3 (Just c)
    getStartOfPacketMarker4' (c:str) n (Just c4) (Just c3) (Just c2) (Just c1)
      | allDifferent packetMarker = n
      | otherwise                 = getStartOfPacketMarker4' str (n + 1) (Just c3) (Just c2) (Just c1) (Just c)
      where
        packetMarker = [c4, c3, c2, c1]
        allDifferent [] = True
        allDifferent (x:[]) = True
        allDifferent (x:xs) = not (elem x xs) && allDifferent xs


main =
  do
    input <- getLine
    print (getStartOfPacketMarker4 input)