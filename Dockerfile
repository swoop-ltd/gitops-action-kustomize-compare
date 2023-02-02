FROM ubuntu:20.04

RUN apt-get -y update && \
    apt-get -y install wget curl git

RUN wget -nv https://github.com/mikefarah/yq/releases/download/2.1.1/yq_linux_amd64 && \
    chmod 744 yq_linux_amd64 && \
    mv yq_linux_amd64 /usr/local/bin/yq && \
    curl -o /tmp/install_kustomize.sh -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  && \
    cd /tmp && ./install_kustomize.sh 4.5.5 && \
    mv kustomize /usr/local/bin/kustomize

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
