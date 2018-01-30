FROM openjdk:8

RUN mkdir -p /opt

RUN curl -o /opt/interproscan-5.27-66.0-64-bit.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz
RUN curl -o /opt/interproscan-5.27-66.0-64-bit.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz.md5

WORKDIR /opt

RUN md5sum -c interproscan-5.27-66.0-64-bit.tar.gz.md5

RUN mkdir -p /opt/interproscan

RUN  tar -pxvzf interproscan-5.27-66.0-64-bit.tar.gz \
    --exclude="interproscan-5.27-66.0/data/cdd" \
    --exclude="interproscan-5.27-66.0/data/hamap" \
    --exclude="interproscan-5.27-66.0/data/phobius" \
    --exclude="interproscan-5.27-66.0/data/pirsf" \
    --exclude="interproscan-5.27-66.0/data/sfld" \
    --exclude="interproscan-5.27-66.0/data/smart" \
    --exclude="interproscan-5.27-66.0/data/superfamily" \
    --exclude="interproscan-5.27-66.0/data/tmhmm" \
    -C /opt/interproscan --strip-components=1

ENTRYPOINT ["/bin/bash", "interproscan/interproscan.sh"]

# Example CMD
# docker run --rm --name interproscan -v /tmp:/tmp olat/interproscan-docker -dp --goterms --pathways -f tsv --appl "PfamA,TIGRFAM,PRINTS,PrositePatterns,Gene3d" -o /tmp/out.ipr -i /tmp/test.fasta