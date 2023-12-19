if [[ $# -eq 0 ]] ; then
    echo 'Usage: ./remove_client.sh unique_client_name'
    exit 1
fi

CIENTNAME=$1

docker-compose run --rm openvpn ovpn_revokeclient $CLIENTNAME remove
