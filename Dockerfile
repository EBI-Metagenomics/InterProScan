FROM openjdk:8

RUN mkdir -p /my_interproscan
RUN cd /my_interproscan
RUN curl -o /my_interproscan/interproscan-5.27-66.0-64-bit.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz 
RUN curl -o /my_interproscan/interproscan-5.27-66.0-64-bit.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz.md5

WORKDIR /my_interproscan

RUN md5sum -c interproscan-5.27-66.0-64-bit.tar.gz.md5

RUN tar -pxvzf interproscan-5.27-66.0-64-bit.tar.gz

# ENTRYPOINT []
#
# CMD []
