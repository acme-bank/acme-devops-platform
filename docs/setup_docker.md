# Docker Setup #

sudo vi /etc/systemd/system/multi-user.target.wants/docker.service

ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376 --tlsverify --tlscacert=/etc/docker/certs/ca.pem --tlscert=/etc/docker/certs/server.pem --tlskey=/etc/docker/certs/server-key.pem

sudo systemctl daemon-reload

sudo service docker restart



docker-machine --tls-ca-cert ~/.docker/machine/certs/host01/ca.pem --tls-client-cert ~/.docker/machine/certs/host01/client.pem --tls-client-key ~/.docker/machine/certs/host01/client-key.pem create --driver none --url tcp://10.1.0.5:2376 host01

eval $(docker-machine env host01)

eval $(docker-machine env -u)

docker ps
