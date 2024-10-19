FROM ubuntu:latest

# Update and install packages in one layer, and clean up afterwards
RUN apt update -y && \
    apt install -y python3-pip git curl wget node-hawk node-minimist && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Install AWS CLI and Boto3
RUN pip3 --no-cache-dir install --upgrade awscli boto3


# Make sure twistcli is executable

# Copy twistcli to the appropriate directory
COPY ./twistcli /usr/local/bin
RUN chmod +x /usr/local/bin/twistcli

# Set entrypoint
ENTRYPOINT ["twistcli"]
