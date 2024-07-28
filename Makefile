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



# Install dependencies
install: venv ## Install dependencies
	pip install -r requirements.txt

# Run tests
test: ## Run Django tests
	python manage.py test

# Clean temporary files
clean: ## Clean temporary files
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete

## access bash
bash:
	@docker compose exec $${service:-backend} $${cmd:-bash}

## access db bash
bash-db:
	@service=db make bash 

# Build assets
build-assets: ## Build static assets
	# npm run build # Assuming you're using npm to manage your asset bundling
	@python manage.py collectstatic --noinput
