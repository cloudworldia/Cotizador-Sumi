FROM docker.n8n.io/n8nio/n8n:2.30.6

USER root

RUN npm install -g pdf-parse mammoth xlsx csv-parser file-type

# Force-reinstall the correct musl binding for n8n's bundled canvas dependency
RUN find /usr/local/lib/node_modules/n8n/node_modules/.pnpm -maxdepth 1 -name "@napi-rs+canvas*" -exec sh -c 'npm rebuild --prefix "$1"' _ {} \;

USER node
