build: deps
	npm run build

test: deps
	npm test

lint: deps
	node_modules/.bin/coffeelint src/

dev: deps
	npm run dev

deps: node_modules

.PHONY: test deps lint

node_modules:
	npm install
	touch node_modules
