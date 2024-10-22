FROM ubuntu:22.04

# Install dependencies and clean up
RUN apt update -y && \
    apt install -y python3-pip git curl wget node-hawk node-minimist && \
    pip3 --no-cache-dir install --upgrade awscli boto3 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download twistcli binary
RUN curl --progress-bar -L \
    --header "authorization: Bearer $$twistcli_TOKEN" \
    https://asia-northeast1.cloud.twistlock.com/japan-1167212692/api/v1/util/arm64/twistcli \
    # https://asia-northeast1.cloud.twistlock.com/japan-1167212692/api/v1/util/twistcli \
    -o /usr/local/bin/twistcli && \
    chmod +x /usr/local/bin/twistcli &&\
   # cp ./twistcli /usr/local/bin/ \
    ls -l /usr/local/bin/twistcli
   # COPY ./twistcli /usr/local/bin/

# chmod +x /usr/local/bin/twistcli 

# Set the entrypoint
ENTRYPOINT ["twistcli"]