build:
	@docker build -t my-golang-app .

run:
	@docker run --rm -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app

test:
	@docker run --rm -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app go test

sh:
	@docker run -it -v "$(PWD)/go/excellent:/usr/src/app" -w /usr/src/app my-golang-app /bin/bash

actionlint:     ### Usage: make actionlint
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" rhysd/actionlint:latest

shellcheck:     ### Usage: make shellcheck FILE=lib/pipe_error_sample.sh
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" koalaman/shellcheck $(FILE)

secretlint:     ### Usage: make secretlint
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" secretlint/secretlint secretlint --maskSecrets '**/*'

gitleaks:       ### Usage: make gitleaks
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" zricethezav/gitleaks detect --source="$(PWD)" --verbose --redact --log-opts="--all --full-history"

trivy:          ### Usage: make trivy IMAGE=alpine:latest
	@docker run --rm aquasec/trivy image $(IMAGE)

trivy-local:    ### Usage: make trivy-local IMAGE=my-golang-app
	@docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image $(IMAGE)

conftest:       ### Usage: make trivy-local IMAGE=my-golang-app
	@docker run --rm -v "$(PWD):$(PWD)" -w "$(PWD)" openpolicyagent/conftest test --policy policy/ .github/workflows/

openssf:        ### Usage: make openssf REPO=kikumiyako/learning-practical-guide
	@docker run -e GITHUB_AUTH_TOKEN=$$(gh auth token) gcr.io/openssf/scorecard:stable --repo=$(REPO)