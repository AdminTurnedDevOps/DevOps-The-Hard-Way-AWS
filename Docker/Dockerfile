FROM python:latest

RUN mkdir /build
WORKDIR /build

COPY app/requirements.txt /build

RUN pip install -r requirements.txt

COPY app /build

EXPOSE 5000

CMD [ "python", "app.py" ]
