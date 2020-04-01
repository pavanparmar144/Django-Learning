FROM python:3-alpine

RUN apk add --no-cache python3-dev \
   && pip3 install --upgrade pip

ADD . /crudexample

WORKDIR /crudexample

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD exec gunicorn crudexample.wsgi:application --bind 0.0.0.0:8000 --workers 3
