# Start with an official Python image
FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Install pytest and requests using pip
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

# Install Python dependencies
RUN pip install --no-cache-dir requests pytest

# Verify Docker and Python installation
RUN docker --version
RUN python --version
RUN pip show requests pytest

# Set the working directory inside the container where your test files will be stored
WORKDIR /workspace

# Optionally, copy your local code and tests into the container (if you’re using Dockerfile inside a project)
COPY . /workspace

# Expose Docker socket if you want the container to interact with the Docker daemon (needed for Docker-in-Docker)
VOLUME /var/run/docker.sock

# The default command for Jenkins or CI will run pytest automatically
# This will execute pytest to run the tests in the 'tests' directory by default
CMD ["pytest"]

