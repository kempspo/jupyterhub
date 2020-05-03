FROM jupyterhub/jupyterhub:1.0.0
LABEL maintainer="Kemp Po <kempspo@gmail.com>"

RUN pip install oauthenticator jupyterhub-kubespawner
# Workaround for kubespawner conflicting dependencies
RUN pip install git+https://github.com/jupyterhub/kubespawner.git

# Copy project files
COPY jupyterhub_config.py /srv/jupyterhub/
WORKDIR /srv/jupyterhub/

EXPOSE 8000
EXPOSE 8081

# Run the script
CMD ["jupyterhub"]