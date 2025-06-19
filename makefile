.DEFAULT_GOAL=build
BINARY_NAME=example_plugin.plugin


.PHONY: deps
deps:
	@echo "fixing dependencies..."
	go mod tidy
	go mod vendor


.PHONY: templ
templ:
	@echo "generating templ files..."
	templ generate -path internal/template


.PHONY: tailwind
tailwind:
	@echo "processing tailwindcss..."
	./node_modules/.bin/tailwindcss -i ./static/css/input.css -o ./static/css/output.css


.PHONY: build
build: tailwind templ
	go build -o build/${BINARY_NAME} .
