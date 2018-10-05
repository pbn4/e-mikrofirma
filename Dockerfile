FROM ubuntu:16.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal software-properties-common

RUN add-apt-repository -y ppa:webupd8team/java &&\
    apt-get update &&\
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections &&\
    apt-get -y install oracle-java8-installer

RUN useradd -m user
USER user

RUN cd /home/user &&\
    wget https://www.finanse.mf.gov.pl/documents/766655/6211156/e-mikrofirma_1.3.0.0.tar.gz &&\
    mkdir e-mikrofirma &&\
    mv e-mikrofirma_1.3.0.0.tar.gz /home/user/e-mikrofirma &&\
    cd e-mikrofirma &&\
    tar zxf e-mikrofirma_1.3.0.0.tar.gz

WORKDIR /home/user

CMD cd e-mikrofirma/micro &&\
    java -jar MicroLauncher.lib
