targets = SignalDetector

.PHONY: clean run

SignalDetector: SignalDetector.hs
	ghc SignalDetector.hs

clean:
	rm -f *.o *.hi $(targets)

run: SignalDetector
	cat input.txt | ./SignalDetector