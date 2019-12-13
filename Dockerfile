FROM BASE_IMAGE

RUN apt-get update
RUN apt-get install -y sudo

RUN groupadd --gid _GID _GID_NAME || [ "$?" = "9" ] && groupmod -g _GID _GID_NAME
RUN export uid=_UID gid=_GID && \
    mkdir -p /etc/sudoers.d && \
    mkdir -p /home/docker && \
    echo "docker:x:${uid}:${gid}::/home/docker:/bin/bash" >> /etc/passwd && \
    echo "docker:x:${uid}:" >> /etc/group && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \
    chmod 0440 /etc/sudoers.d/docker && \
    chown ${uid}:${gid} -R /home/docker

RUN echo "root:Docker!" | chpasswd

USER docker
ENV USER docker
ENV HOME /home/docker

#CMD bash
