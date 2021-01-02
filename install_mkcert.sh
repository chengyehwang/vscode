export VER="v1.3.0"
wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/${VER}/mkcert-${VER}-linux-amd64
wget -O mkcert.exe https://github.com/FiloSottile/mkcert/releases/download/${VER}/mkcert-${VER}-windows-amd64.exe
chmod 755 mkcert
chmod 755 mkcert.exe
./mkcert -install
