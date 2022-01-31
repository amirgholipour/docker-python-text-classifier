# docker build -t skasmani/text-classifier-service .
# docker run -it --rm skasmani/text-classifier-service

FROM jupyter/datascience-notebook

RUN pip install flask

COPY models/* /home/skasmani/work/models/
COPY api.py /home/skasmani/work

WORKDIR /home/skasmani/work
ENV FLASK_APP=api.py
# ENV FLASK_DEBUG=0
CMD ["flask", "run", "--host=0.0.0.0"]