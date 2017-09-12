FROM scratch
ENV USER mrosset
ENV HOME /home/$USER
ENV GOPATH $HOME/gocode
ENV PATH $GOPATH/bin:$HOME/tools/bin:/bin
SHELL ["/home/mrosset/tools/bin/bash", "-c"]
COPY etc /etc
COPY bin /bin
COPY root/home /home
RUN chown $USER.$USER $HOME
RUN chown $USER.$USER $HOME/tools
USER mrosset:root
VOLUME $HOME/.cache
CMD ["/home/mrosset/tools/bin/bash"]
WORKDIR /home/$USER