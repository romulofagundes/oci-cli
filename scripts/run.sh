#!/bin/sh

echo ${OCI_CLI_KEY} | base64 -d > /home/oci/.oci/key.pem

cat <<EOF > /home/oci/.oci/config
[DEFAULT]
user=${OCI_CLI_USER}
fingerprint=${OCI_CLI_FINGERPRINT}
key_file=/home/oci/.oci/key.pem
tenancy=${OCI_CLI_TENANCY}
region=${OCI_CLI_REGION}
EOF

oci setup repair-file-permissions --file /home/oci/.oci/key.pem
oci setup repair-file-permissions --file /home/oci/.oci/config
oci ce cluster create-kubeconfig --cluster-id ${OCI_CLUSTER_ID} --region ${OCI_CLI_REGION} --token-version 2.0.0

#Execução dos comandos que vierem como parâmetro.
$@