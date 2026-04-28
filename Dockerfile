# Dockerfile
# Start by pulling the python image
FROM python:3-slim

# Switch working directory
WORKDIR /app

# Copy the requirements file into the image
COPY ./requirements.txt ./

# Install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# Copy every content from the local file to the image
COPY src .

# Configure the container to run in an executed manner
# CMD gunicorn --bind 0.0.0.0:5000 app:app
CMD ["gunicorn",  "--bind",  "0.0.0.0:5000", "app:app"]
