# Convert id_rsa to PPK using docker container

Convert id_rsa to id_rsa.ppk using puttygen.

`docker pull madhub/idrsa2ppk`
`docker run --rm -v $(pwd):/sshkey madhub/idrsa2ppk`

It takes a id_rsa mounted unter /sshkey and converts it to a Putty private key as id_rsa.ppk.

## Environment variables
|Name|default|
|----|-------|
|ID_RSA_PATH| /sshkey|
|ID_RSA_FILENAME |id_rsa|
|OUT_PATH |/sshkey|

## Example
Use a docker data container to extract the id_rsa. Here is an example to extract the ppk file on a windows host (docker for windows) in order to use it for putty connections.

Create a Docker data volume with a sshkey.

`docker run -v /root/.ssh -e KEY_GEN_PATH=/root/.ssh --name keystore madhub/ssh-keygen`

> See also https://hub.docker.com/r/madhub/ssh-keygen

Extract the created id_rsa of the docker data volume into a windows host path.

`docker run --rm --volumes-from keystore -v /c/tmp:/out -e ID_RSA_PATH=/root/.ssh -e OUT_PATH=/out madhub/idrsa2ppk`
