.PHONY: all clean

targets = RPSScorer RPSParser

RPSScorer: RPSScorer.hs RPSParser.hs
	ghc RPSScorer.hs

RPSParser: rpsparser.hs
	ghc RPSParser.hs

clean:
	rm -f *.hi *.o $(targets)
