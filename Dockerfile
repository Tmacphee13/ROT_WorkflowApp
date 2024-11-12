FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y python3.9 python3-pip

WORKDIR /app
COPY app .

EXPOSE 5000

ENV FLASK_APP=run.py
ENV FLASK_ENV=development

RUN pip install -r requirements.txt

CMD ["flask", "run", "--host=0.0.0.0"]