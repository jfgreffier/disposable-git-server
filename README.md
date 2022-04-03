# disposable-git-server
Disposable unauthenticated Git server over HTTP. Intended for Kata practice, it offers no security whatsoever. You shouldn't even use it.

If you need a Git server in Docker, please use **git-server-docker** available on [GitHub](https://github.com/jkarlosb/git-server-docker) and [Docker Hub](https://hub.docker.com/r/jkarlos/git-server-docker/)

## Usage
```
docker build . -t disposable-git-server
docker run -it -p 80:80 -e PORT=80 disposable-git-server

git clone http://localhost/git/myrepo.git
```

## Deploy to Heroku
This image is deployable on Heroku  
https://devcenter.heroku.com/articles/container-registry-and-runtime#getting-started

```
heroku container:login
heroku create
heroku container:push web
heroku container:release web
heroku open
```

You can then clone the repo using `git clone https://<app-name>.herokuapp.com/git/myrepo.git`
