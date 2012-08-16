test:
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script --recursive --growl --require should --watch

.PHONY: test

devserver:
	node-dev app.js