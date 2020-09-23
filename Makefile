all:
	@echo "make clean        # Removes all LOCAL images and containers"
	@echo "make build        # Builds a 1.16.1 and 1.14.1 image and pushes them  to quay"
	@echo ""
	@echo "make build-1-16-1"
	@echo make build-1-14-1
	@echo "make push-1-16-1  #Builds and pushes the 1.16.1 image to quay.io"
	@echo "make push-1-14-1  #Builds and pushes the 1.14.1 image to quay.io"
	@echo ""
	@echo "make run16        #Builds and runs the 1.16.1 image locally"
	@echo "make run14        #Builds and runs the 1.14.1 image locally"

build-json::
	cp 1.16.1-json/* .
	docker build -t quay.io/jpacker/nginx-json:1.16.1 .
	rm ./Dockerfile ./index.html

build-1-16-1::
	cp 1.16.1/* .
	docker build -t quay.io/jpacker/nginx:1.16.1 .
	rm ./Dockerfile ./index.html

push-json:: build-json
	docker push quay.io/jpacker/nginx-json:1.16.1
	
push-1-16-1:: build-1-16-1
	docker push quay.io/jpacker/nginx:1.16.1

build-1-14-1:: build-1-14-1
	cp 1.14.1/* .
	docker build -t quay.io/jpacker/nginx:1.14.1 .
	rm ./Dockerfile ./index.html

push-1-14-1::
	docker push quay.io/jpacker/nginx:1.14.1

run14:: build-1-14-1
	docker run --name nginx-1-14-1 -d quay.io/jpacker/nginx:1.14.1

run16:: build-1-16-1
	docker run --name nginx-1-16-1 -d quay.io/jpacker/nginx:1.16.1

clean::
	rm ./Dockerfile ./index.html || true
	docker image rm quay.io/jpacker/nginx:1.14.1 || true
	docker image rm quay.io/jpacker/nginx:1.16.1 || true
	docker rm -f nginx-1-16-1 || true
	docker rm -f nginx-1-14-1 || true

build::build-1-16-1 push-1-16-1 build-1-14-1 push-1-14-1 clean
	@echo Done!