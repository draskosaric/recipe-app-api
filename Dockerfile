#Always choose alpine version of python, it's quicker
FROM python:3.7-alpine
MAINTAINER Drasko Saric

#Run Python in unbuffered mode which is recommendef for Python in docker
ENV PYTHONUNBUFFERED 1

#Copy requirements.txt file from project to docker image
COPY ./requirements.txt /requirements.txt

#Install all dependencies from requirements.txt file
RUN pip install -r /requirements.txt

#Create folder app to copy the content of folder with source code
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Create a user that will run application using docker
RUN adduser -D user
USER user
