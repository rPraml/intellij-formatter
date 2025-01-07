FROM debian:bookworm-slim

MAINTAINER praml@foconis.de

RUN apt-get update && \
    apt-get install -y wget tar libfreetype6-dev && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*


RUN echo 'Downloading IntelliJ IDEA' && \
    wget https://download.jetbrains.com/idea/ideaIC-2024.3.1.1.tar.gz -O /tmp/intellij.tar.gz -q && \
    echo 'Installing IntelliJ IDEA' && \
    mkdir -p /opt/intellij && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    echo 'Cleanup' && \
    rm /tmp/intellij.tar.gz && \
# remove all plugins but not java & java ide
    find /opt/intellij/plugins -mindepth 1 -maxdepth 1 -type d | \
        grep -ve "/java$" | \
        grep -ve "/json$" | \
        grep -ve "/java-ide-customization$" | \
        xargs rm -r && \
# remove not necessary files in distibution
    rm /opt/intellij/lib/groovy.jar \
        /opt/intellij/lib/grpc.jar \
        /opt/intellij/lib/testFramework.jar \
        /opt/intellij/lib/ant \
        /opt/intellij/lib/bouncy-castle.jar \
        /opt/intellij/jbr/lib/libcef.so \
        /opt/intellij/jbr/lib/libjcef.so \
        /opt/intellij/jbr/lib/locales \
        /opt/intellij/bin/repair \
        /opt/intellij/bin/restarter \
        -rf
RUN rm /opt/intellij/plugins/plugin-classpath.txt

# Dirty trick to remove the IntelliJ configuration directory created on the fly
RUN echo 'rm -rf ?' >> /opt/intellij/bin/idea.sh
RUN echo idea.config.path=/tmp/ic/config >> /opt/intellij/bin/idea.properties && \
    echo idea.system.path=/tmp/ic/system >> /opt/intellij/bin/idea.properties && \
    echo idea.plugins.path=/tmp/ic/plugins >> /opt/intellij/bin/idea.properties
# create .local directory for various settings
RUN mkdir /.local
RUN chmod 777 /.local
WORKDIR /tmp

ENTRYPOINT ["/opt/intellij/bin/format.sh", "-r" , "/data" , "-charset", "utf-8"]