build: deps
	npm run build

clean:
	rm -rf build

test: deps
	npm test

lint: deps
	node_modules/.bin/coffeelint src/

dev: deps
	npm run dev

deploy: build
	git add build/
	git commit -m "commit bundle for deploy"
	cp -R build build-tmp
	git checkout gh-pages
	cp -R build-tmp/* ./
	rm -rf build-tmp
	git add -A
	git commit -am "update static bundle"
	git push

deps: node_modules

.PHONY: test deps lint

node_modules:
	npm install
	touch node_modules
