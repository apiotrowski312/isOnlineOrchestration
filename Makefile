.DEFAULT_GOAL := help
.PHONY: help

REPOSITORIES = users-api.git sites-api.git utils-go.git oauth-api.git
DIRECTORIES_TO_TEST = users-api.dir sites-api.dir utils-go.dir oauth-api.dir
PROJ = utils-go

DBS = users-db oauth-cassandra sites-db
SERVICES = oauth-cassandra oauth sites

RED='\033[0;31m'
NC='\033[0m' # No Color

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------

git-init: $(REPOSITORIES) ## Download all repositories

%.git: 
	@git clone git@github.com:apiotrowski312/isOnline-$@ ../$*

# -----------------------------------------------------------------------------
# Tests
# -----------------------------------------------------------------------------

unit: ${PROJ}.dir ## Run unit tests from choosen directory (Use flag: PROJ=utils-go)

unittest: $(DIRECTORIES_TO_TEST) ## Run all unit tests

%.dir: 
	@echo -e ${RED}UNIT TEST FOR $*${NC}
	@docker run --rm -v $(PWD)/../$*:/src golang:1.13 sh -c "cd /src; go mod download 2> /dev/null; go test /src/... -cover"
	@echo -e ----------------------------

# -----------------------------------------------------------------------------
# Docker
# -----------------------------------------------------------------------------

up: ## Start everything
	docker-compose up -d

up-db: ## Start databases
	docker-compose up -d $(DBS)

up-svc: ## Start services
	docker-compose up -d $(SERVICES)

logs: ## Show all docker-compose logs
	docker-compose logs -f

stop: ## Stops all containers
	docker-compose stop

stop-svc: ## Stops all services containers
	docker-compose stop $(SERVICES)

down: ## Destroy *ALL* docker containers, volumes, network etc.
	docker-compose down

# -----------------------------------------------------------------------------
# Other
# -----------------------------------------------------------------------------

help: ## Show this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
