FROM python:latest

RUN mkdir /build
WORKDIR /build

COPY app/ /build

COPY app/requirements.txt /build

RUN pip3 install -r requirements.txt

CMD ["python", "app.py"]