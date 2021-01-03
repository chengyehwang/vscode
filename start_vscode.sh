#!/bin/bash
source /opt/miniconda3/etc/profile.d/conda.sh
conda activate
host_ext=$1
host=`ifconfig | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | grep 172.17.0`
port=99
export SHELL=/bin/bash
export DISPLAY=:${port}

# X window
#xpra start :${port} --bind-tcp=0.0.0.0:6080

#echo "*******************************************"
#echo "xpra tcp://jupyterlab:jupyterlab@$host_ext:6080"
#echo "*******************************************"

# jupyterlab user setting
#mkdir -p ~/.jupyter/lab
#cp -rf /jupyterlab/user-settings ~/.jupyter/lab/

mkdir -p ~/.local/share/code-server/User
cp /opt/local/User/settings.json ~/.local/share/code-server/User/

echo "*******************************************"
echo "open browser: https://$host_ext:8888"
echo "*******************************************"

code-server --auth none --bind-addr $host:8888 --cert /opt/${host_ext}.pem --cert-key /opt/${host_ext}-key.pem --extensions-dir /opt/ext
