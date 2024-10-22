FROM ubuntu:22.04

# Install dependencies and clean up
RUN apt update -y && \
    apt install -y python3-pip git curl wget node-hawk node-minimist && \
    pip3 --no-cache-dir install --upgrade awscli boto3 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy twistcli binary
COPY ./twistcli /usr/local/bin

# Make sure twistcli is executable
RUN chmod +x /usr/local/bin/twistcli

# Set the entrypoint
ENTRYPOINT ["twistcli"]