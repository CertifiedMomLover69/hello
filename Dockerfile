# Use the official Python image as the base image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Install FFmpeg and any other dependencies you may need
RUN apt-get update && apt-get install -y ffmpeg

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Define environment variable for FFmpeg
ENV FFMPEG_PATH /usr/bin/ffmpeg

# Run your Python script when the container starts
CMD ["python", "main.py"]
