FROM sagemath/sagemath:9.8

# Install Jupyter
RUN sage -pip install notebook

# Make sure everything is run as a user (not root)
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/$NB_USER

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER

USER $NB_USER
WORKDIR $HOME

CMD ["sage", "--notebook=jupyter"]
