FROM n8nio/n8n:2.30.6

USER root

RUN npm install -g \
    pdf-parse@1.1.1 \
    mammoth \
    xlsx \
    csv-parser \
    file-type

RUN mkdir -p /home/node/.n8n/nodes \
 && cd /home/node/.n8n/nodes \
 && npm init -y \
 && npm install pdfjs-dist@5.4.296

RUN find /usr/local/lib/node_modules/n8n/node_modules/.pnpm \
    -maxdepth 1 \
    -name "@napi-rs+canvas*" \
    -exec sh -c 'npm rebuild --prefix "$1"' _ {} \;

USER node
