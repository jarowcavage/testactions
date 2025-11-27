FROM python:bookworm

# Install required packages

WORKDIR /app

COPY . .

RUN echo '#!/bin/sh' > /app/hello.sh && \
    echo 'echo "Hello, World!"' >> /app/hello.sh && \
    echo 'echo "Installed packages: curl and boto3"' >> /app/hello.sh && \
    echo 'echo "Testing curl:"' >> /app/hello.sh && \
    echo 'curl --version | head -n 1' >> /app/hello.sh && \
    echo 'echo "Testing boto3:"' >> /app/hello.sh && \
    echo 'python3 -c "import boto3; print(f\"boto3 version: {boto3.__version__}\")"' >> /app/hello.sh && \
    chmod +x /app/hello.sh

CMD ["/app/hello.sh"]
