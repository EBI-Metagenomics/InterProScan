FROM openjdk:8

ENV IPR 5
ENV IPRSCAN "$IPR.27-66.0"

RUN mkdir -p /opt

RUN curl -o /opt/interproscan-$IPRSCAN-64-bit.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/interproscan-$IPRSCAN-64-bit.tar.gz
RUN curl -o /opt/interproscan-$IPRSCAN-64-bit.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPR/$IPRSCAN/interproscan-$IPRSCAN-64-bit.tar.gz.md5

WORKDIR /opt

RUN md5sum -c interproscan-$IPRSCAN-64-bit.tar.gz.md5

RUN mkdir -p /opt/interproscan

RUN  tar -pxvzf interproscan-$IPRSCAN-64-bit.tar.gz \
    --exclude="interproscan-$IPRSCAN/data/cdd" \
    --exclude="interproscan-$IPRSCAN/data/hamap" \
    --exclude="interproscan-$IPRSCAN/data/phobius" \
    --exclude="interproscan-$IPRSCAN/data/pirsf" \
    --exclude="interproscan-$IPRSCAN/data/prodom" \
    --exclude="interproscan-$IPRSCAN/data/sfld" \
    --exclude="interproscan-$IPRSCAN/data/smart" \
    --exclude="interproscan-$IPRSCAN/data/superfamily" \
    --exclude="interproscan-$IPRSCAN/data/tmhmm" \
    -C /opt/interproscan --strip-components=1

RUN rm -f interproscan-$IPRSCAN-64-bit.tar.gz interproscan-$IPRSCAN-64-bit.tar.gz.md5

ENTRYPOINT ["/bin/bash", "interproscan/interproscan.sh"]

# Example CMD
# docker run --rm --name interproscan -v /tmp:/tmp olat/interproscan-docker -dp --goterms --pathways -f tsv --appl "PfamA,TIGRFAM,PRINTS,PrositePatterns,Gene3d" -o /tmp/out.ipr -i /tmp/test.fasta