# Create Certificates #

## Create CA Cert ##


openssl genrsa -aes256 -out ca-key.pem 4096

openssl req -new -x509 -days 3650 -key ca-key.pem -sha256 -out ca.pem


## Create Server Cert ##


openssl genrsa -out server-key.pem 4096

openssl req -subj "/CN=host01" -sha256 -new -key server-key.pem -out server.csr

echo subjectAltName = DNS:host01,IP:10.1.0.5,IP:127.0.0.1 >> server-extfile.cnf

echo extendedKeyUsage = serverAuth >> server-extfile.cnf

openssl x509 -req -days 3650 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server.pem -extfile server-extfile.cnf


## Create Client Cert ##


openssl genrsa -out client-key.pem 4096

openssl req -subj '/CN=client' -new -key client-key.pem -out client.csr

echo extendedKeyUsage = clientAuth >> client-extfile.cnf

openssl x509 -req -days 3650 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out client.pem -extfile client-extfile.cnf
