FROM ubuntu:18.04

RUN dpkg --add-architecture i386

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y libc6:i386 libstdc++6:i386 glibc-doc:i386 gcc-5-base:i386 gcc-6-base:i386 libgcc1:i386 \
     openjdk-8-jdk zip unzip ant lib32z1 adb phantomjs wget git

# Install App Engine
RUN apt-get install -y wget git
RUN mkdir -p /opt/appengine
RUN cd /opt/appengine
RUN wget --no-verbose -O /tmp/appengine.zip https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.68.zip
RUN cd opt/appengine && unzip -o /tmp/appengine.zip

# Configure shell
ENV PATH="/opt/appengine/appengine-java-sdk-1.9.68/bin:${PATH}"

# Configure java
RUN update-java-alternatives -s java-1.8.0-openjdk-amd64

# Download source
RUN git clone --recursive https://github.com/mit-cml/appinventor-sources.git /opt/src

# Build it
WORKDIR /opt/src/appinventor
RUN ant clean && ant MakeAuthKey
RUN ant

# Run it
COPY startserver.sh .
RUN chmod +x ./startserver.sh
CMD ./startserver.sh
