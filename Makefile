IMAGE=gdi/intro-to-docker
CONTAINER=dockerintro

default: dev

dev:
	# Build updated docker image
	docker build -t $(IMAGE) .
	# Remove the old container (if there is one)
	docker rm -f $(CONTAINER) 2>/dev/null || true
	# Run container with volume to slides to make changes on the fly
	docker run -d --name $(CONTAINER) -v $(shell pwd):/usr/src/app -p 8000:8000 $(IMAGE)