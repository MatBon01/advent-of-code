targets = PairParser Utils

.PHONY: clean run

PairParser: PairParser.hs Utils.hs
	ghc PairParser.hs

run: PairParser
	cat input.txt | ./PairParser

clean:
	rm -f *.o *.hi $(targets)