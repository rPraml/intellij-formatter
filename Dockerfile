FROM debian:bookworm-slim

MAINTAINER praml@foconis.de

RUN apt-get update && \
    apt-get install -y wget tar libfreetype6-dev && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'Downloading IntelliJ IDEA' && \
    wget https://download.jetbrains.com/idea/ideaIC-2023.3.2.tar.gz -O /tmp/intellij.tar.gz -q && \
    echo 'Installing IntelliJ IDEA' && \
    mkdir -p /opt/intellij && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm /tmp/intellij.tar.gz

# Dirty trick to remove the IntelliJ configuration directory created on the fly
RUN echo 'rm -rf ?' >> /opt/intellij/bin/idea.sh
RUN echo idea.config.path=/tmp/ic/config >> /opt/intellij/bin/idea.properties && \
    echo idea.system.path=/tmp/ic/system >> /opt/intellij/bin/idea.properties && \
    echo idea.plugins.path=/tmp/ic/plugins >> /opt/intellij/bin/idea.properties

WORKDIR /tmp

ENTRYPOINT ["/opt/intellij/bin/format.sh", "-r" , "/data" , "-charset", "utf-8"]