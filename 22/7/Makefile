targets = Utils FileSystemParser

.PHONY: clean run

FileSystemParser: FileSystemParser.hs Utils.hs
	ghc FileSystemParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: FileSystemParser
	cat input.txt | ./FileSystemParser