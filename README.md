# OpenEthereum Test Client for Leopold Blockchain 

How can I access the Leopold test environment?

## 2. Getting Started

### 2.1 Two Secret Files will be needed

- /environment/staging/secrets/AccountMnemonic
- /environment/staging/secrets/NetworkMnemonic

Please, get in contact with [sprunck@muenchen.ihk.de](mailto:sprunck@muenchen.ihk.de) for more details.

### 2.2 Authorize executable files

After downloading, the executable files under Linux must also be given appropriate rights. Since different binaries 
are needed for Ubuntu and macOS, the genKeys.sh script decides which ones should be executed.

```shell
chmod +x \*.sh
chmod +x ./ethUtils_ubuntu/\*
chmod +x ./ethUtils_mac/\*
```

### 2.3 Configure `.env`

Copy `.env.example` to `.env` and set `LEOPOLD_ACCOUNT_PK` (never commit it, `.env` is git-ignored).
`start_staging.sh` keeps your values and only updates `PWD`.

| Variable | Purpose | Default |
|---|---|---|
| `LEOPOLD_NODE_URL` | RPC URL of the local Leopold node, used by `c4t-contracts-api-slim` | `http://node:8545` |
| `LEOPOLD_CONTRACT_ADDRESS` | HashValueManager contract address | `0x9834FF49d61ac04Cd8Bf2E21a12F8aacc007A8E4` |
| `LEOPOLD_ACCOUNT_ADDRESS` | Account used to sign transactions | `0xbD004d9048C9b9e5C4B5109c68dd569A65c47CF9` |
| `LEOPOLD_ACCOUNT_PK` | Private key of that account (required) | - |

### 2.4 Start the test node

```shell
./start_staging.sh
```

This also starts `c4t-contracts-api-slim` (Swagger UI: http://localhost:9141/swagger-ui.html,
health: http://localhost:9141/actuator/health).

## 2. Architecture

The following diagram shows the Leopold OTC staging environment. Within the IHK Munich (green box), there are 
three OpenEthereum nodes that represent the actual blockchain. Two of these nodes are validator nodes, namely 
Host 1 and 2. A third node serves only as an API interface, providing an RPC interface to the outside, namely 
Host 3. All other software components are used for monitoring the Leopold blockchain.

### 2.1 Deployment

![](images/leopold-infrastructure-view-staging.png)

### 2.2 Topology

![](images/leopold-topologie-stag-6.2.1.png)


## 3. Contracts Api Slim

Check the current status of a document:
```shell
curl -X 'GET' 'http://localhost:9141/api/cbc/v1/LEOPOLD/contracts/0xd83F2780f7277f902d08AE2b5D45784476B4112d/documents/0xe887b2f083866a96f0cd14cc5d54f1cee090fa68ddcf307c39a192459e056cf4/status'
```

Add a new document to the blockchain:
```shell
curl -X 'PUT' \
  'http://localhost:9141/api/cbc/v1/LEOPOLD/contracts/0xd83F2780f7277f902d08AE2b5D45784476B4112d/documents/0xe887b2f083866a96f0cd14cc5d54f1cee090fa68ddcf307c39a192459e056cf4' \
  -H 'Authorization: Basic aXNzdWVyOmlzc3VlcjEyMw=='
```

Revoke a document:
```shell
curl -X 'PUT' \
  'http://localhost:9141/api/cbc/v1/LEOPOLD/contracts/0xd83F2780f7277f902d08AE2b5D45784476B4112d/documents/0xe887b2f083866a96f0cd14cc5d54f1cee090fa68ddcf307c39a192459e056cf4/revoke' \
  -H 'Authorization: Basic aXNzdWVyOmlzc3VlcjEyMw=='
```

Revalidate a document:
```shell
curl -X 'PUT' \
  'http://localhost:9141/api/cbc/v1/LEOPOLD/contracts/0xd83F2780f7277f902d08AE2b5D45784476B4112d/documents/0xe887b2f083866a96f0cd14cc5d54f1cee090fa68ddcf307c39a192459e056cf4/revalidate' \
  -H 'Authorization: Basic aXNzdWVyOmlzc3VlcjEyMw=='
```

Delete a document:
```shell
curl -X 'DELETE' \
  'http://localhost:9141/api/cbc/v1/LEOPOLD/contracts/0xd83F2780f7277f902d08AE2b5D45784476B4112d/documents/0xe887b2f083866a96f0cd14cc5d54f1cee090fa68ddcf307c39a192459e056cf4' \
  -H 'Authorization: Basic aXNzdWVyOmlzc3VlcjEyMw=='
```
