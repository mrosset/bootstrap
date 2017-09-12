FROM busybox
ENV USER mrosset
ENV HOME /home/$USER
ENV GOPATH $HOME/gocode
ENV PATH $GOPATH/bin:$HOME/tools/bin:/bin
SHELL ["/home/mrosset/tools/bin/bash", "-c"]
COPY etc /etc
COPY bin /bin
USER mrosset
VOLUME $HOME/.cache
CMD ["/home/mrosset/tools/bin/bash"]
WORKDIR /home/$USER