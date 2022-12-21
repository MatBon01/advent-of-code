targets = BagContentsAnalyser BagContentsParser Utils

.PHONT: clean

BagContentsAnalyser: BagContentsParser.hs Utils.hs
	ghc BagContentsAnalyser.hs

BagContentsParser: BagContentsParser.hs Utils.hs
	ghc BagContentsParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: BagContentsAnalyser
	cat input.txt | ./BagContentsAnalyser
