FROM jenkins/jenkins

ARG MAVEN_VERSION=3.5.2
ARG MAVEN_URL=https://www.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ARG MAVEN_DIR=apache-maven-${MAVEN_VERSION}

USER root

RUN wget --no-cookies --no-check-certificate "${MAVEN_URL}" -O /tmp/maven.tar.gz && \
    wget --no-cookies --no-check-certificate "${MAVEN_URL}.asc" -O /tmp/maven.tar.gz.asc && \
    wget --no-cookies --no-check-certificate "https://www.apache.org/dist/maven/KEYS" -O /tmp/maven.KEYS && \
    gpg --import /tmp/maven.KEYS && \
    gpg --verify /tmp/maven.tar.gz.asc /tmp/maven.tar.gz && \
    mkdir /opt/maven && \
    tar -xzvf /tmp/maven.tar.gz -C /opt/maven/ && \
    cd /opt/maven && \
    ln -s ${MAVEN_DIR}/ default && \
    rm -f /tmp/maven.* && \
    update-alternatives --install "/usr/bin/mvn" "mvn" "/opt/maven/default/bin/mvn" 1 && \
    update-alternatives --set "mvn" "/opt/maven/default/bin/mvn"

ENV MAVEN_HOME /opt/maven/default
ENV M2_HOME ${MAVEN_HOME}
ENV PATH ${PATH}:${MAVEN_HOME}/bin

USER ${user}
