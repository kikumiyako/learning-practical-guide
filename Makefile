build:
	@docker build -t my-golang-app .

run:
	@docker run --rm -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app

test:
	@docker run --rm -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app go test

sh:
	@docker run -it -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app /bin/bash

actionlint:
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" rhysd/actionlint:latest

shellcheck:  ### Usage: make shellcheck FILE=lib/pipe_error_sample.sh
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" koalaman/shellcheck $(FILE)

secretlint:
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" secretlint/secretlint secretlint --maskSecrets '**/*'

gitleaks:
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" zricethezav/gitleaks detect --source="$(PWD)" --verbose --redact --log-opts="--all --full-history"
