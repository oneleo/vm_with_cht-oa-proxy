#!/bin/bash
# CHT Proxy Server IP
CHT_PROXY_IP="10.160.3.88"

# CHT Proxy Server Port
CHT_PROXY_PORT="8080"

# CHT Proxy
CHT_PROXY="http://${CHT_PROXY_IP}:${CHT_PROXY_PORT}/"

if [ ! -f "/etc/systemd/system/docker.service.d/http-proxy.conf" ]; then
	# Set /etc/apt/apt.conf
	echo "Acquire::http::Proxy \"${CHT_PROXY}\";" >> "/etc/apt/apt.conf" 2>&1

	# Set /etc/default/docker
	echo "export http_proxy=\"${CHT_PROXY}\"" >> "/etc/default/docker" 2>&1

	# Set /etc/systemd/system/docker.service.d/http-proxy.conf
	mkdir –p '/etc/systemd/system/docker.service.d'
	echo "[Service]" >> "/etc/systemd/system/docker.service.d/http-proxy.conf" 2>&1
	echo "Environment=\"HTTP_PROXY=${CHT_PROXY}\"" >> "/etc/systemd/system/docker.service.d/http-proxy.conf" 2>&1

	# Set ~/.bashrc
	echo "export http_proxy=\"${CHT_PROXY}\"" >> "${HOME}/.bashrc" 2>&1
	echo "export https_proxy=\"${CHT_PROXY}\"" >> "${HOME}/.bashrc" 2>&1
	echo "export HTTP_PROXY=\"${CHT_PROXY}\"" >> "${HOME}/.bashrc" 2>&1
	echo "export HTTPS_PROXY=\"${CHT_PROXY}\"" >> "${HOME}/.bashrc" 2>&1
	
	sudo service docker restart
	sudo systemctl daemon-reload
	sudo systemctl restart docker
 # for docker build and docker run
        mkdir -p ~/.docker
cat << END > ~/.docker/config.json
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "${CHT_PROXY}",
     "httpsProxy": "${CHT_PROXY}",
     "noProxy": "localhost,127.0.0.1"
   }
 }
}
END

fi
