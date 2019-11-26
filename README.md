## Overview

Simple lab for spinning up 3-node ES cluster using Docker compose. Not intended for production use, but running ES as though it were in production. Only slightly more convenient than having 3 terminal tabs open.


### How to set up

1. Create a directory called `my-es` where you cloned the repo.
2. Get a copy of ES (not archived) and place it in the above directory.
3. Build a docker image from that your ES version (see [Dockerfile](./Dockerfile) for command).
4. Run `docker-compose up` in the directory where this repo was cloned.
