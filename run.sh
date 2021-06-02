#!/bin/bash

# docker exec -it dev /bin/sh

docker start dev && \
docker exec dev /bin/sh -c 'cd /cs2511 && \
    ls -R --directory --color=never */.git \
        | sed "s/\/.git//" \
        | xargs -P10 -I{} git -C {} pull'
