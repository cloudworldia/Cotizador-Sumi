FROM docker.n8n.io/n8nio/n8n:2.30.6

USER root

RUN npm install -g \
    pdf-parse \
    mammoth \
    xlsx \
    csv-parser \
    file-type

USER node