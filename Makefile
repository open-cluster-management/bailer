cluster-scan:
	./memory-scanner.sh

cluster-diff:
	python3 ./spot-the-difference.py

build:
	docker build -t spot-the-diff:latest .