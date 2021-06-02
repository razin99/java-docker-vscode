# What is this?
This helps if you want to use java in docker. I'm currently using this for
COMP2511 in 21T2. You may need to edit `run.sh` and/or `init.sh` to suite your
needs

# Pre-requisite
Download `jdk-11.0.11_linux-x64_bin.tar.gz` from oracle, you may need to sign
in. If you want to use a different version, you'll need to modify the
`Dockerfile`

# Build image
```
docker build -t oracle-jdk-11 .
```
* Tag it aka name it as `oracle-jdk-11`

# Create container and volume
```
docker run -dit --name dev -v cs2511:/cs2511 oracle-jdk-11:latest
```
* Name the container `dev`
* Mount (and create if it volume does not exist) volume called `cs2511`, into
  container at `/cs2511`

# Run it!
```
 docker exec -it dev /bin/sh
```

# End result:
* image size: 413MB, still large but wtv, just using it for development
* for a leaner (smaller) deployment footprint, maybe use alpine instead

# TODO:
    [ ] Add an initialisation script
    [ ] Add a run script (it should start with the desired terminal, and pull
        in latest changes)
