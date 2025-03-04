# Use a Python base image
FROM python:3.9-alpine

# Install dependencies (git, pytest, etc.)
RUN apk add --no-cache git && \
    docker \
    bash \
    curl \
    && rm -rf /var/cache/apk/*
    pip install pytest requests

# Clone the Git repository containing your tests
RUN git clone https://github.com/diana0ro/api_test.git /app

# Set the working directory to the project folder
WORKDIR /app

# Run the tests when the container starts
CMD ["pytest", "tests"]
