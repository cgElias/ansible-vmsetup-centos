FROM gitlab/gitlab-ce:latest

# set maintainer
LABEL maintainer "elias.tatros@capgemini.com"

# set a health HEALTHCHECK
HEALTHCHECK --interval=10s --timeout=10s CMD curl -f http://localhost:80 || exit 1

# set environment variables
ENV GITLAB_PORT=10080
ENV GITLAB_SSH_PORT=10022

# Expose Port
# EXPOSE 10080 10022


#-detach
#--hostname localhost
#--env 'GITLAB_PORT=10080'
#--env 'GITLAB_SSH_PORT=10022'
#--publish 10022:22 --publish 10080:80
#--name gitlab --restart always
#--volume /srv/gitlab/config:/etc/gitlab
#--volume /srv/gitlab/logs:/var/log/gitlab
#--volume /srv/gitlab/data:/var/opt/gitlab
#gitlab/gitlab-ce:latest"


#new
#-detach
#-P
#--volume /srv/gitlab/config:/etc/gitlab
#--volume /srv/gitlab/logs:/var/log/gitlab
#--volume /srv/gitlab/data:/var/opt/gitlab
