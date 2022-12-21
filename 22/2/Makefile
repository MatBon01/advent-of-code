.PHONY: all clean

targets = RPSScorer1 RPSParser1 RPSParser Utils RPSScorer

RPSScorer: RPSScorer.hs RPSParser.hs Utils.hs
	ghc RPSScorer.hs

RPSParser: RPSParser.hs Utils.hs
	ghc RPSParser.hs

RPSScorer1: RPSScorer1.hs RPSParser1.hs Utils.hs
	ghc RPSScorer1.hs

RPSParser1: RPSParser1.hs Utils.hs
	ghc RPSParser1.hs

Utils: Utils.hs
	ghc Utils.hs

clean:
	rm -f *.hi *.o $(targets)
