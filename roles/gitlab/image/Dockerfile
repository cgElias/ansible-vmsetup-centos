FROM gitlab/gitlab-ce:latest

# set maintainer
LABEL maintainer "elias.tatros@capgemini.com"

# set a health HEALTHCHECK
HEALTHCHECK --interval=10s --timeout=10s CMD curl -f http://localhost:80 || exit 1

# set environment variables
ENV GITLAB_PORT=10080
ENV GITLAB_SSH_PORT=10022
