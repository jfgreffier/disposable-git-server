FROM nginx:stable-alpine
WORKDIR /git-server/

RUN apk add --no-cache git git-daemon fcgiwrap spawn-fcgi

COPY nginx.conf /etc/nginx/nginx.conf.template

# create repo
RUN mkdir myrepo.git
RUN cd myrepo.git && git init --bare
RUN git config --system http.receivepack true


CMD spawn-fcgi -s /run/fcgi.sock /usr/bin/fcgiwrap && \
    envsubst '\$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && \
    nginx -g "daemon off;"
