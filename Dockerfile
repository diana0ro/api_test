# Start with an official Python image
FROM python:3.9-slim

# Install pytest and requests using pip
RUN pip install --no-cache-dir pytest requests

# Set the working directory inside the container where your test files will be stored
WORKDIR /workspace

# Optionally, copy your local code and tests into the container (if you’re using Dockerfile inside a project)
COPY . /workspace

# Expose Docker socket if you want the container to interact with the Docker daemon (needed for Docker-in-Docker)
VOLUME /var/run/docker.sock

# The default command for Jenkins or CI will run pytest automatically
# This will execute pytest to run the tests in the 'tests' directory by default
CMD ["pytest"]

