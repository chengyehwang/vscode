FROM ubuntu:20.10
MAINTAINER ChengYehWang

# basic apt installation
RUN apt update 
RUN export DEBIAN_FRONTEND=noninteractive && apt-get upgrade -y
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y x11-apps psmisc sudo sshfs wget python net-tools vim git make gcc apt-utils libnss3 iproute2 libgtk2.0-0 libgconf-2-4 libnotify-dev libnss3-tools --fix-missing
RUN mkdir -p /opt
RUN cd /opt

# mkcert
COPY install_mkcert.sh /root/install_mkcert.sh
RUN chmod 755 /root/install_mkcert.sh
RUN /root/install_mkcert.sh

# install trace_processor
#RUN wget http://get.perfetto.dev/trace_processor
#RUN chmod 755 trace_processor
#RUN ./trace_processor --help

# install conda
#RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#RUN chmod 755 ./Miniconda3-latest-Linux-x86_64.sh
#RUN ./Miniconda3-latest-Linux-x86_64.sh -b -f -p /opt/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.2-Linux-x86_64.sh
RUN chmod 755 ./Miniconda3-py38_4.8.2-Linux-x86_64.sh
RUN ./Miniconda3-py38_4.8.2-Linux-x86_64.sh -b -f -p /opt/miniconda3

SHELL ["/bin/bash", "-c", "-l"]

# conda major packages, including jupyterlab
COPY install_conda_package.sh /root/install_conda_package.sh
RUN chmod 755 /root/install_conda_package.sh
RUN source /opt/miniconda3/etc/profile.d/conda.sh && conda activate && /root/install_conda_package.sh

# pip, jupyterlab extension or others
COPY User /opt/local/User
COPY install_ext.sh /root/install_ext.sh
RUN chmod 755 /root/install_ext.sh
RUN source /opt/miniconda3/etc/profile.d/conda.sh && conda activate && /root/install_ext.sh

RUN cd /opt ; /opt/mkcert 192.168.0.189 ; chmod 444 /opt/*.pem

# Data sync for users who get image only
COPY Dockerfile /opt/Dockerfile
COPY start_vscode.sh /opt/start_vscode.sh
# User jupyter & home init


ARG USER_ID=1001
ARG GROUP_ID=1001
ARG USER=vscode

RUN export PASSWD=`openssl passwd ${USER}` && \
    groupadd -g ${GROUP_ID} ${USER} && \
    useradd -l -m -u ${USER_ID} -g ${USER} -G sudo -p $PASSWD -s /bin/bash ${USER} && \
    install -d -m 0755 -o ${USER} -g ${USER} /home/${USER}

RUN echo "source /opt/miniconda3/etc/profile.d/conda.sh" >> /home/${USER}/.bashrc
RUN echo "conda activate" >> /home/${USER}/.bashrc

RUN chown -R ${USER}:${USER} /home/${USER}
RUN mkdir /tmp/.X11-unix
RUN chmod 1777 /tmp/.X11-unix

USER ${USER}
#workdir /home/jupyter
