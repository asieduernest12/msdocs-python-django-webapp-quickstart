# Variables
VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
DJANGO_MANAGE := $(PYTHON) manage.py

# Color codes
YELLOW := \033[1;33m
CYAN := \033[1;36m
NC := \033[0m

# Default target
all: help

# Help target
help:
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*?## "}; \
		/^[a-zA-Z_-]+:.*?## / {printf "$(CYAN)%-15s$(NC) $(YELLOW)%s$(NC)\n", $$1, $$2}' $(MAKEFILE_LIST)

# Create virtual environment
venv: ## Create a virtual environment
	python3 -m venv $(VENV)

# Install dependencies
install: venv ## Install dependencies
	$(PIP) install -r requirements.txt

# Run tests
test: ## Run Django tests
	$(DJANGO_MANAGE) test

# Clean temporary files
clean: ## Clean temporary files
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
	rm -rf $(VENV)

## access bash
bash:
	@docker compose exec $${service:-backend} $${cmd:-bash}

## access db bash
bash-db:
	@service=db make bash 
