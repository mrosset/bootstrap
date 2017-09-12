build:
	bin/bootstrap build

tools:
	bin/bootstrap tools

clean:
	bin/clean

tarball:
	bin/bootstrap tarball

.PHONY: docker

root-x86_64-lfs-linux-gnu.tar.xz: tarball

docker/root:
	mkdir -v docker/root
	tar xf root-x86_64-lfs-linux-gnu.tar.xz -C docker/root

docker: docker/Dockerfile docker/root
	docker build -t strings/lfs:devel docker

start:
	-docker rm -f lfs
	docker run --name lfs -it -e TERM=$(TERM) strings/lfs:devel /bin/bash

elf: docker/tools
	ls docker/tools/bin/size
	readelf -l docker/tools/bin/size
