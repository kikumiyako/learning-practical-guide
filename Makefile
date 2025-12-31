build:
	docker build -t my-golang-app .

run:
	docker run --rm -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app

test:
	docker run --rm -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app go test

sh:
	docker run -it -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app /bin/bash
