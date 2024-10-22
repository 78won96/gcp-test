FROM alpine

# Install dependencies and clean up
RUN apt-get update -y && \
    apt-get install -y python3-pip git curl wget node-hawk node-minimist && \
    pip3 --no-cache-dir install --upgrade awscli boto3 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download twistcli binary
RUN curl --progress-bar -L \
    --header "authorization: Bearer $$twistcli_TOKEN" \
    https://asia-northeast1.cloud.twistlock.com/japan-1167212692/api/v1/util/twistcli > twistcli; chmod a+x twistcli;

COPY ./twistcli /usr/local/bin

    # Set the entrypoint
ENTRYPOINT ["twistcli"]