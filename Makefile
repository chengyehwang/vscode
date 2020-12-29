IP=$(shell hostname -I | awk '{print $$1}')
ARGS=-e DISPLAY -u $(shell id -u):$(shell id -g) --mount src=`pwd`,target=/vscode,type=bind -w /vscode --privileged --ipc=host
# run process
pull:
	docker pull chengyehwang/vscode
	docker tag chengyehwang/vscode vscode
run:
	docker run -i $(ARGS)  -p 9000:9000 -p 8080:8080 -p 8888:8888 -p 8880:8880 -p 6080:6080 -t vscode /vscode/start_vscode.sh $(IP)
cmd:
	docker run -i $(ARGS) -t vscode /root/miniconda3/bin/ipython demo.py
ut:
	docker run -i $(ARGS) -t vscode /root/miniconda3/bin/python -m unittest demo_module
stop:
	-docker stop $(shell docker ps -a -q)
	-docker rm $(shell docker ps -a -q)
# build process
build:
	docker build -t vscode:latest .
shell:
	docker run -i $(ARGS) --net host -t vscode
push:
	docker login
	docker tag vscode chengyehwang/vscode
	docker push chengyehwang/vscode
clean:
	docker system prune -a
image:
	docker image ls -a
SHELL := /bin/bash
test:
	cd a ; time ../show.py >& log &
	cd c ; time ../show.py >& log &

