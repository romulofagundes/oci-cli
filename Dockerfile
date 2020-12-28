FROM python:3.8.7-alpine

ENV OCI_CLI_USER="" OCI_CLI_KEY="" OCI_CLI_FINGERPRINT="" OCI_CLI_TENANCY="" OCI_CLI_REGION=""

RUN apk add --no-cache build-base libffi-dev openssl-dev curl \
  && addgroup -S oci \
  && adduser -S oci -G oci \
  && pip install oci-cli \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x kubectl \
  && mv kubectl /usr/local/bin

USER oci
WORKDIR /home/oci
COPY ./scripts/run.sh .
RUN mkdir /home/oci/.oci

ENTRYPOINT [ "/home/oci/run.sh" ]
  
