test:
	./node_modules/.bin/mocha \
		--compilers coffee:coffee-script --recursive --growl --require should --watch

devserver:
	node-dev app.js