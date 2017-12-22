FROM jenkins/jenkins:2.78-alpine

# set maintainer
LABEL maintainer "elias.tatros@capgemini.com"

# set a health HEALTHCHECK
HEALTHCHECK --interval=5s --timeout=10s CMD curl -f http://127.0.0.1:8000 || exit 1

# set environment variables


# Expose Port
EXPOSE 8080 50000
