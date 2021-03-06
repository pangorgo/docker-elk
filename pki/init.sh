#!/bin/bash
set -e

./clean.sh
./gen_root_ca.sh capass changeit
./gen_node_cert.sh 0 changeit capass && ./gen_node_cert.sh 1 changeit capass &&  ./gen_node_cert.sh 2 changeit capass
./gen_client_node_cert.sh spock changeit capass
./gen_client_node_cert.sh kirk changeit capass

# copy certs
cp node-0-keystore.jks ../elasticsearch/config/
cp truststore.jks ../elasticsearch/config/
cp ca/root-ca.pem ../kibana/
