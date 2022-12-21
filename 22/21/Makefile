targets = MonkeyCalculator MonkeyParser Utils

.PHONY: clean run

MonkeyCalculator: MonkeyCalculator.hs MonkeyParser.hs Utils.hs
	ghc MonkeyCalculator.hs

MonkeyParser: MonkeyParser.hs Utils.hs
	ghc MonkeyParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: MonkeyCalculator
	cat input.txt | ./MonkeyCalculator
