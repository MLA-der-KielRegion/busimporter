FROM node:22.13.1-alpine AS busimport
RUN mkdir /build
RUN apk -U upgrade
RUN apk add --no-cache bash
COPY . /build/
WORKDIR /build
RUN npm install
RUN npx tsc
WORKDIR /dist
RUN chmod 755 /build/bash_scripts/terser.sh
RUN /build/bash_scripts/terser.sh .

FROM node:22.13.1-alpine
ENV NPM_CONFIG_LOGLEVEL info
RUN apk -U upgrade
WORKDIR /home/node
RUN mkdir -p node_modules
COPY --from=busimport /build/dist/ ./
COPY --from=busimport /build/node_modules/ ./node_modules/
RUN ls -l
