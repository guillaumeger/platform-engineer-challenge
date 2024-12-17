THIS_FILE := $(lastword $(MAKEFILE_LIST))

helm_bin = $(shell command -v helm3 2> /dev/null || command -v helm)
dry-run: deps dry-run-chart
install: deps install-chart

deps:
	$(helm_bin) dep update

dry-run-chart:
	$(helm_bin) diff --allow-unreleased --color -f values.yaml cluster-config . --debug

install-chart: dry-run-chart validate-install
	$(helm_bin) upgrade --install -f values.yaml cluster-config .

validate-install:
	@echo -n "Are you sure you want to deploy? [y/N] " && read ans && [ $${ans:-N} = y ]

delete: validate-delete
	$(helm_bin) delete cluster-config

validate-delete:
	@echo -n "Are you sure you want to delete release? [y/N] " && read ans && [ $${ans:-N} = y ]

template-chart: deps
	$(helm_bin) template ./ -f values.yaml