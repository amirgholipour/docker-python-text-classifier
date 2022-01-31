# docker-python-text-classifier

From Dev to Ops. This is the source code for the 3 part series on building a text classifier in Python and Docker

For development use:

    docker run -it -p 8888:8888 -v $(pwd):/home/skasmani/work jupyter/datascience-notebook

For deployment use:

    docker build -t skasmani/text-classifier-service .
    docker run -it --rm -p 5000:5000 skasmani/text-classifier-service

