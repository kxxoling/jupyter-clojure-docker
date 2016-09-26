# clojupyter docker image

This is a non official ``Dockerfile`` for [clojupyter](https://github.com/roryk/clojupyter)
to build a docker image to combine the power of Jupyter notebook and Clojure.


## Usage

This project is already published on Docker hub, you can pull the image and use it by

    docker run kxxoling/jupyter-clojure-docker

It's encouraged to be used in detaching mode, and removed after container is stopped.
Port mapping and volume mounting is also supported.

For advanced usage:

```
docker run -d \
    -p 8888:8888 \
    kxxoling/jupyter-clojure-docker
```

