all:
	@echo make build
	@echo make run

build-1-16-1::
	cp 1.16.1/* .
	docker build -t quay.io/jpacker/nginx:1.16.1 .
	rm ./Dockerfile ./index.html

build-1-14-1::
	cp 1.14.1/* .
	docker build -t quay.io/jpacker/nginx:1.14.1 .
	rm ./Dockerfile ./index.html

run::
	docker run --name nginx-1-16-1 -d quay.io/jpacker/nginx:1.16.1

clean::
	rm ./Dockerfile ./index.html || true
	docker image rm quay.io/jpacker/nginx:1.14.1 || trure
	docker image rm quay.io/jpacker/nginx:1.16.1 || trure