.PHONY: help
# Display all commands
help: # Show this help.
	@awk '/^#/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]_-]+:/{print substr($$1,1,index($$1,":")),c}1{c=0}' $(MAKEFILE_LIST) | column -s: -t


.PHONY: start-infra
# Start Infra docker-compose
start-infra:
	COMPOSE_HTTP_TIMEOUT=160 docker-compose  start

.PHONY: stop-infra
# Start Infra docker-compose
stop-infra:
	COMPOSE_HTTP_TIMEOUT=160 docker-compose stop
