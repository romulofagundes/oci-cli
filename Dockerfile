FROM python:3.9.13-alpine3.15

ENV OCI_CLI_USER="" OCI_CLI_KEY="" OCI_CLI_FINGERPRINT="" OCI_CLI_TENANCY="" OCI_CLI_REGION=""

RUN apk add --no-cache build-base libffi-dev openssl-dev curl \
  && addgroup -S oci \
  && adduser -S oci -G oci \
  && pip install oci-cli \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && curl -LO https://get.helm.sh/helm-v3.9.2-linux-amd64.tar.gz \
  && tar zxvf helm-v3.9.2-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/local/bin \
  && rm -Rf linux-amd64 \
  && mv kubectl /usr/local/bin \
  && chmod +x /usr/local/bin/kubectl

USER oci
WORKDIR /home/oci
COPY ./scripts/run.sh .
RUN mkdir /home/oci/.oci
