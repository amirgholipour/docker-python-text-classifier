# docker build -t skasmani/text-classifier-service .
# docker run -it --rm -p 5000:5000 skasmani/text-classifier-service

FROM jupyter/datascience-notebook
#FROM jupyter/scipy-notebook

RUN pip install flask
RUN pip install -U scikit-learn
COPY models/* /home/skasmani/work/models/
COPY api.py /home/skasmani/work

WORKDIR /home/skasmani/work
ENV FLASK_APP=api.py
# ENV FLASK_DEBUG=0
CMD ["flask", "run", "--host=0.0.0.0"]