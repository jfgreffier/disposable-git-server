FROM alpine:3.15
WORKDIR /git-server/

RUN apk add --no-cache git git-daemon

# create repo
RUN mkdir myrepo.git
RUN cd myrepo.git && git init --bare


RUN touch /git-server/myrepo.git/git-daemon-export-ok


EXPOSE 9418

CMD ["git ", "daemon", "--enable=receive-pack", "--base-path=/git-server/"]
