targets = Utils FileSystemParser

.PHONY: clean run

FileSystemAnalyser: FileSystemAnalyser.hs FileSystemParser.hs Utils.hs
	ghc FileSystemAnalyser.hs

FileSystemParser: FileSystemParser.hs Utils.hs
	ghc FileSystemParser.hs

clean:
	rm -f *.o *.hi $(targets)

run: FileSystemAnalyser
	cat input.txt | ./FileSystemAnalyser