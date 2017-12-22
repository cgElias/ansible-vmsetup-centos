FROM jenkins/jenkins:2.78-alpine

# set maintainer
LABEL maintainer "elias.tatros@capgemini.com"

# set a health HEALTHCHECK
HEALTHCHECK --interval=10s --timeout=10s CMD ping -w 3 localhost || exit 1

# set environment variables


# Expose Port
EXPOSE 8080 50000
