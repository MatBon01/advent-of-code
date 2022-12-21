targets = PairParser Utils

.PHONY: clean run

PairAnalyser: PairAnalyser.hs PairParser.hs Utils.hs
	ghc PairAnalyser.hs

PairParser: PairParser.hs Utils.hs
	ghc PairParser.hs

run: PairAnalyser
	cat input.txt | ./PairAnalyser

clean:
	rm -f *.o *.hi $(targets)