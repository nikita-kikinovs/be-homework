#!/bin/sh

docker build --tag be-homework . && \
docker run -it -p 127.0.0.1:3000:3000 \
  -v $(pwd)/app:/app --rm  be-homework /bin/sh
