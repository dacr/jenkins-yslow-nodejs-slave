FROM dacr/jenkins-slave
MAINTAINER crosson.david@gmail.com

#ADD http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz /tmp/
ADD https://iojs.org/dist/v2.1.0/iojs-v2.1.0-linux-x64.tar.gz /tmp/

#RUN cd /opt/ && tar xvfz /tmp/node-v*
RUN cd /opt/ && tar xvfz /tmp/iojs*

#RUN cd /opt/ && ln -s node* node
RUN cd /opt/ && ln -s iojs* node

ENV PATH /opt/node/bin:$PATH

RUN npm install -g express
RUN npm install -g yslow

RUN echo "export TERM=xterm" > /etc/profile.d/globals.sh

ENTRYPOINT [ "/bin/bash" ]
