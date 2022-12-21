.PHONY: all clean

targets = RPSScorer1 RPSParser1 RPSParser Utils RPSScorer

RPSScorer: RPSScorer.hs RPSParser1.hs Utils.hs
	ghc RPSScorer.hs

RPSParser: RPSParser.hs Utils.hs
	ghc RPSParser.hs

RPSParser1: RPSParser1.hs Utils.hs
	ghc RPSParser1.hs

Utils: Utils.hs
	ghc Utils.hs

clean:
	rm -f *.hi *.o $(targets)
