DREPO   = strings/lfs:devel
TARBALL = root-x86_64-lfs-linux-gnu.tar.xz
export CGO_ENABLED=0

default: attach

build:
	bin/bootstrap build

tools:
	bin/bootstrap tools

clean:
	bin/clean

tarball:
	bin/bootstrap tarball

$(TARBALL): tarball

docker/root:
	mkdir -v docker/root
	tar xf $(TARBALL) -C docker/root

docker/bin/via: $(GOPATH)/bin/via
	cp $(GOPATH)/bin/via docker/bin/

docker: docker/Dockerfile docker/bin/via
	docker build -t $(DREPO) docker
	touch $@

start:
	-docker rm -f lfs
	docker run --name lfs -it -d -e TERM=$(TERM) -v /home:/home -v cache:$(HOME)/.cache $(DREPO) /bin/sh --noprofile

attach: docker start
	docker container attach lfs
