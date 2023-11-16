.PHONY: clean build run 


all: build run

# Build the web server binary
build:
	mkdir -p build
	go build -o build/webserver main.go

# Run the web server
run:
	go run main.go

# Run the web server in the background
run-bg:
	go run main.go &

# Kill the webserver in background
kill-bg:
	killall main

# Run go tests for the web server
test:
	go test -v ./...

# Run httpie tests for the web server
httptests:
	http -v http://localhost:8080/
	http -v http://localhost:8080/health
	http -v http://localhost:8080/healthz
	http -v http://localhost:8080/ready
	http -v http://localhost:8080/readyz
	http -v http://localhost:8080/metrics

# Clean up the binary executable
clean:
	rm -fR build
