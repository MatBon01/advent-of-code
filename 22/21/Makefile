targets = MonkeyParser Utils

.PHONY: clean run

MonkeyParser: MonkeyParser.hs Utils.hs
	ghc MonkeyParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: MonkeyParser
	cat input.txt | ./MonkeyParser
