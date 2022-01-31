# docker build -t skasmani/text-classifier-service .
# docker run -it --rm -p 5000:5000 skasmani/text-classifier-service

FROM jupyter/datascience-notebook
#FROM jupyter/scipy-notebook

RUN pip install flask
RUN pip install -U scikit-learn
COPY models/* /home/skasmani/work/models/
COPY api.py /home/skasmani/work

WORKDIR /home/skasmani/work

EXPOSE 8080

ENV FLASK_APP=api.py
CMD ["python3", "api.py", "8080"]
#CMD ["flask", "run","8080"] "--host=0.0.0.0"]