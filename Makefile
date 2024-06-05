SHELL=/bin/bash

check-api-breakage:
	./scripts/check-api-breakage.sh
	
check-broken-symlinks:
	./scripts/check-broken-symlinks.sh
	
check-local-swift-dependencies:
	./scripts/check-local-swift-dependencies.sh
	
run-chmod:
	./scripts/run-chmod.sh


#TODO add more
