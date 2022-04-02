# disposable-git-server
Disposable unauthenticated Git server based on `git daemon`. Intended for Kata practice, it offers no security whatsoever. You shouldn't even use it.

If you need a Git server in Docker, please use **git-server-docker** available on [GitHub](https://github.com/jkarlosb/git-server-docker) and [Docker Hub](https://hub.docker.com/r/jkarlos/git-server-docker/)

## Usage
```
docker build . -t disposable-git-server
docker run -d -p 9418:9418 disposable-git-server
git clone git://localhost/myrepo.git
```

There is an issue in Git for Windows. If you can't push to the repo, add this config: `git config --global sendpack.sideband`  
https://stackoverflow.com/questions/5520329/why-does-a-git-push-just-hang-there-indefinitely-using-mysysgit-1-7-4
