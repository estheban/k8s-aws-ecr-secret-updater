FROM python:3

ENV AWS_REGION=us-east-1
ENV AWS_ACCESS_KEY_ID=""
ENV AWS_SECRET_ACCESS_KEY=""
ENV SECRET_NAME=""

WORKDIR /code
RUN apt-get update \
    && apt-get install -y -qq groff \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip \
    && rm -rf aws \
    && curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/code/entrypoint.sh"]

COPY entrypoint.sh /code/
