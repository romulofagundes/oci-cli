# OCI-CLI + Kubernetes

Projeto voltado para atualização do cluster kubernetes em execução no Oracle OCI.

## Variáveis

- **OCI_CLI_USER**: Identificador do usuário, chave obtida no profile, no campo OCID.
- **OCI_CLI_FINGERPRINT**: Após a adição da chave do usuário, no profile, na seção: **API Keys**.
- **OCI_CLI_KEY**: Após a adição da chave, é possível obter a chave privada, e converter para base64, com o comando: `base64 chave.pem | tr -d \\n`
- **OCI_CLI_TENANCY**: Campo relacionado ao Tenancy da Oracle, obtido através do campo: Administration > Tenancy Details: OCID.
- **OCI_CLUSTER_ID**: Na seção de Kubernetes, obtenha o **Cluster Id**.
- **OCI_CLI_REGION**: A região default da conta.

## Build

```bash
docker build -t suportewbs/oci-cli .
```

## Execução
```bash
docker run --rm \
    -e "OCI_CLI_USER=<OCI_CLI_USER>" \
    -e "OCI_CLI_FINGERPRINT=<OCI_CLI_FINGERPRINT>" \
    -e "OCI_CLI_TENANCY=<OCI_CLI_TENANCY>" \
    -e "OCI_CLUSTER_ID=<OCI_CLUSTER_ID>" \
    -e "OCI_CLI_REGION=<OCI_CLI_REGION>" \
    -e "OCI_CLI_KEY=<OCI_CLI_KEY>" \
    suportewbs/oci-cli kubectl get nodes
```