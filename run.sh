#!/bin/bash

# docker exec -it dev /bin/sh

# Container name
CONTAINER="dev"
# In hex, used by vscode CLI
CONTAINER_HEX="$(echo -n $CONTAINER | xxd -ps -c 200)"

# Path inside container to attach vscode to
REMOTE_PATH="/cs2511"

# Start and pull all new changes from given remote path
docker start $CONTAINER && \
docker exec $CONTAINER /bin/sh -c "cd $REMOTE_PATH && \
    ls -R --directory --color=never */.git \
        | sed \"s/\/.git//\" \
        | xargs -P10 -I{} git -C {} pull"

code --folder-uri="vscode-remote://attached-container+$CONTAINER_HEX/$REMOTE_PATH"
