FROM heroku/cedar:14
MAINTAINER D.H. Bahr <dhbahr@gmail.com>

# Internally, we arbitrarily use port 3000
ENV PORT 3000

WORKDIR /app/user

COPY ./init /usr/bin/init
RUN chmod +x /usr/bin/init

RUN mkdir -p /app/buildpack
RUN git clone https://github.com/openjaf/simple-buildpack-python.git /app/buildpack

RUN /usr/bin/init
