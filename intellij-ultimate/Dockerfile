FROM debian:bookworm-slim

MAINTAINER praml@foconis.de

RUN apt-get update && \
    apt-get install -y wget tar libfreetype6-dev && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*


RUN echo 'Downloading IntelliJ IDEA' && \
    wget https://download.jetbrains.com/idea/ideaIU-2023.3.4.tar.gz -O /tmp/intellij.tar.gz -q && \
    echo 'Installing IntelliJ IDEA' && \
    mkdir -p /opt/intellij && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    echo 'Cleanup' && \
    rm /tmp/intellij.tar.gz

#RUN echo 'Downloading PHPStorm' && \
#    wget https://download-cdn.jetbrains.com/webide/PhpStorm-2023.3.3.tar.gz -O /tmp/phpstorm.tar.gz -q && \
#    echo 'Installing PHPStorm' && \
#    mkdir -p /opt/phpstorm && \
#    tar -xf /tmp/phpstorm.tar.gz --strip-components=1 -C /opt/phpstorm && \
#    echo 'Cleanup' && \
#    rm /tmp/phpstorm.tar.gz

#RUN cp -r /opt/phpstorm/plugins/* /opt/intellij/plugins/

# remove all plugins but not java & java ide
#RUN    find /opt/intellij/plugins -mindepth 1 -maxdepth 1 -type d | \
#        grep -ve "/java$" | \
#        grep -ve "/java-ide-customization$" | \
#        xargs rm -r && \
# remove not necessary files in distibution
#    rm /opt/intellij/lib/groovy.jar \
#        /opt/intellij/lib/grpc.jar \
#        /opt/intellij/lib/testFramework.jar \
#        /opt/intellij/lib/ant \
#        /opt/intellij/lib/bouncy-castle.jar \
#        /opt/intellij/jbr/lib/libcef.so \
#        /opt/intellij/jbr/lib/libjcef.so \
#        /opt/intellij/jbr/lib/locales \
#        /opt/intellij/bin/repair \
#        /opt/intellij/bin/restarter \
#        -rf

# Dirty trick to remove the IntelliJ configuration directory created on the fly
RUN echo 'rm -rf ?' >> /opt/intellij/bin/idea.sh
RUN echo idea.config.path=/tmp/ic/config >> /opt/intellij/bin/idea.properties && \
    echo idea.system.path=/tmp/ic/system >> /opt/intellij/bin/idea.properties && \
    echo idea.plugins.path=/tmp/ic/plugins >> /opt/intellij/bin/idea.properties 

COPY format.sh /opt/intellij/bin/format.sh

WORKDIR /tmp

ENTRYPOINT ["/opt/intellij/bin/format.sh", "-r" , "/data" , "-charset", "utf-8"]