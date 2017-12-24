# Dockerfile
FROM node:5.5.0
WORKDIR /home/node/app
RUN npm install -g http-server
RUN ln -s /usr/bin/nodejs /usr/bin/node
ENTRYPOINT ["/usr/local/bin/http-server", "-p", "8091", "--cors"]
EXPOSE 8091
