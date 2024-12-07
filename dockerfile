FROM ghcr.io/actions/actions-runner:2.321.0

USER root

# Update and upgrade the system
RUN apt-get update -y && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y --no-install-recommends \
    curl \
    wget \
    build-essential \
    libssl-dev \
    libffi-dev \
    jq \
    sudo \
    libasound2-dev \
    libudev-dev \
    unzip \
    pkg-config \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/bin
RUN just --version

# Copy the start script and make it executable
COPY start.sh /start.sh
RUN chmod +x /start.sh

USER runner 

# Define the entrypoint
ENTRYPOINT ["/start.sh"]
