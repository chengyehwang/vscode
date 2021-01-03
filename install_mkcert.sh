export VER="v1.3.0"
wget -O /opt/mkcert https://github.com/FiloSottile/mkcert/releases/download/${VER}/mkcert-${VER}-linux-amd64
wget -O /opt/mkcert.exe https://github.com/FiloSottile/mkcert/releases/download/${VER}/mkcert-${VER}-windows-amd64.exe
chmod 755 /opt/mkcert
chmod 755 /opt/mkcert.exe
/opt/mkcert -install
cp -r /root/.local/share/mkcert /opt/ca
chmod 444 /opt/ca/*.pem
