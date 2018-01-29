FROM openjdk:8

RUN mkdir -p /opt

# RUN curl -o /opt/interproscan-5.27-66.0-64-bit.tar.gz ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz
# RUN curl -o /opt/interproscan-5.27-66.0-64-bit.tar.gz.md5 ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.27-66.0/interproscan-5.27-66.0-64-bit.tar.gz.md5

ADD interproscan /opt/interproscan

WORKDIR /opt

# RUN md5sum -c interproscan-5.27-66.0-64-bit.tar.gz.md5

# RUN tar -pxvzf interproscan-5.27-66.0-64-bit.tar.gz

# "--appl", "PfamA,TIGRFAM,PRINTS,PrositePatterns,Gene3d"
# "-o", "result.tsv", "-i", "input.fasta"

ENTRYPOINT ["/bin/bash", "interproscan/interproscan.sh", "-dp", "--goterms", "--pathways", "-f", "tsv"]
