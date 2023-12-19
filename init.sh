set -e

OVPN_DATA=./openvpn-data/conf
IP=$(curl -s https://api.ipify.org)

rm -rf $OVPN_DATA
mkdir -p $OVPN_DATA

# You will be prompted for passwords for keys,
# Use the same password for simplicity
# Store password in Secure place, you
# Will need it tio generate clients later on
docker-compose run --rm openvpn ovpn_genconfig -u udp://$IP
docker-compose run --rm openvpn ovpn_initpki

sudo chown -R $(whoami): ./openvpn-data

docker-compose up -d openvpn
