.PHONY: all clean

targets = RPSScorer1 RPSParser1

RPSScorer1: RPSScorer1.hs RPSParser1.hs
	ghc RPSScorer1.hs

RPSParser1: RPSParser1.hs
	ghc RPSParser1.hs

clean:
	rm -f *.hi *.o $(targets)
