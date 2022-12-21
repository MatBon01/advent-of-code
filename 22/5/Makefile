targets = Utils CrateParser

.PHONY: clean run

CrateParser: CrateParser.hs Utils.hs
	ghc CrateParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: CrateParser
	cat input.txt | ./CrateParser