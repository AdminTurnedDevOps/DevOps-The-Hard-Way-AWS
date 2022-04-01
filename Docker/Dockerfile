FROM python:latest

RUN mkdir /build
WORKDIR /build

COPY app /build

COPY app/requirements.txt /build

RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt

EXPOSE 5000

CMD [ "python", "app.py" ]