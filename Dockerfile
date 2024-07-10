## Use the official lightweight Python image.
## https://hub.docker.com/_/python
#FROM python:3.9-slim
#
## Allow statements and log messages to immediately appear in the Knative logs
#ENV PYTHONUNBUFFERED True
#
## Copy local code to the container image.
#ENV APP_HOME /app
#WORKDIR $APP_HOME
#COPY . ./
#
## Install production dependencies.
#RUN pip install -r requirements.txt
#
## Run the web service on container startup. Here we use the gunicorn
## webserver, with one worker process and 8 threads.
## For environments with multiple CPU cores, increase the number of workers
## to be equal to the cores available.
## Timeout is set to 0 to disable the timeouts of the workers to allow Cloud Run to handle instance scaling.
#CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV PORT 8080

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "main.py"]
