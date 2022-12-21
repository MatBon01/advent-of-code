targets = BagContentsParser

.PHONT: clean

BagContentsParser: BagContentsParser.hs Utils.hs
	ghc BagContentsParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: BagContentsParser
	cat input.txt | ./BagContentsParser
