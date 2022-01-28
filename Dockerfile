# docker build -t mvonrohr/text-classifier-service .
# docker run -it --rm mvonrohr/text-classifier-service

FROM jupyter/datascience-notebook

RUN pip install flask

COPY models/* /home/saeed/work/models/
COPY service.py /home/saeed/work

# COPY models/* ./models/
# COPY service.py ./service.py
# COPY train.py ./train.py
# COPY api.py ./api.py


WORKDIR /home/saeed/work
# ENV FLASK_APP=service.py
ENV FLASK_DEBUG=1
# CMD ["flask", "run", "--host=0.0.0.0"]
EXPOSE 8080
ENTRYPOINT FLASK_APP=service.py flask run --host=0.0.0.0 --port=8080
