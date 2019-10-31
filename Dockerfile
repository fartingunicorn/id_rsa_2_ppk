FROM gliderlabs/alpine:3.9
MAINTAINER Franz Mathauser <franz.mathauser@gmail.com>

RUN apk-install putty

ENV ID_RSA_PATH /sshkey
ENV ID_RSA_FILENAME id_rsa
ENV OUT_PATH /sshkey

CMD puttygen $ID_RSA_PATH/$ID_RSA_FILENAME -O private -o $OUT_PATH/$ID_RSA_FILENAME.ppk
