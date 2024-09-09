DEFAULT_GOAL := help

VENV_DIR ?= venv

TESTS_DIR=./tests
NOTEBOOKS_DIR=./notebooks
NOTEBOOKS_SANITIZE_FILE=$(TESTS_DIR)/notebook-tests.cfg

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

.PHONY: help
help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

virtual-environment: $(VENV_DIR)  ## update venv, create a new venv if it doesn't exist make
	echo "If you want this to be rerun, run make clean first"
$(VENV_DIR): setup.py setup.cfg
	[ -d $(VENV_DIR) ] || python3 -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/pip install --upgrade pip wheel
	$(VENV_DIR)/bin/pip install -r requirements.txt

	touch $(VENV_DIR)
clean: $(VENV_DIR)
	touch setup.py

first-venv: ## create a new virtual environment for the very first repo setup
	python3 -m venv $(VENV_DIR)

	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install versioneer
	# don't touch here as we don't want this venv to persist anyway


