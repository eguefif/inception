if [ ! -f "/etc/ssl/certs/cert.cert" ]; then
	openssl genrsa -des3 -out rootCA.key 2048
	openssl req -x509 -new -nodes -key rootCA.key -sha256 -says 730 -out rootCert.pem
	openssl genrsa -out cert.key 2048
	openssl req -new -key cert.key -out cert.csr
	openss x509 -req -in cert.csr -CA rootCert.pem -CAkey rootCert.key -CAcreateserial -out cert.crt -days 730 -sha 256 -extfile openssl.cnf
	openssl verify -CAfile rootCert.pem -verify_hostname eguefif.42.fr cert.crt
fi
