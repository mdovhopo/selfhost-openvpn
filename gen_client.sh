if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./gen_client.sh unique_client_name'
    exit 1
fi

CLIENTNAME=$1

docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME

# client config will be print to console
docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME
