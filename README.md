# OpenVPN server guide

This guide will explain how to setup OpenVPN server and how to connect
to it from Mac, Ubuntu, Windows10 OS.


## Prerequirements

All scripts were tested on Docker 19.03.12 on Ubuntu 20.04.

- Up and running VM
- running docker daemon
- docker-compose cli
- open 1194 udp port in VMs firewall
- 1 CPU & 512mb RAM minimum

## OpenVPN server installation

### Prepare working directory

1. Make sure you are logged in as `root` user.
2. Create directory `openvpn` in any convinient location.
3. Go into that directory. (all scripts later on will assume that you are in that created directory)
4. Copy [docker-compose.yml](./docker-compose.yml) file to the directory root
5. Copy helper scripts ([init.sh](./init.sh), [gen_client.sh](./gen_client.sh), [remove_client.sh](./remove_client.sh)) to directory root and make them exacutable `chmod 755 filename`

### Install OpenVPN server

In the root of directory run:

*IMPORTANT* DO NOT RUN THIS SCRIPT IF SERVER IS ALREADY UP.
SCRIPT WILL DELETE ALL EXISTING DATA
```sh
./init.sh
```

You will be prompted for a couple of passwords for certificates.
Use same password for simplicity. Make sure you save this password,
As you will need it later on for generating clients.

Also you will be prompted for host name. Use ipv4 address of VM (example - *67.205.134.29*)

### Generate clients

Pick some unique name for a client.

In the root of directory run:
```sh
./gen_client.sh unique_client_name
```

Read carefully prompts, You will be prompted for password for client
(need to provide new password for each client). Also you will be prompted
for password for certificates. Use the one, that you generated in [this](#install-openvpn-server) step.

Client config will be printed to console, copy it, and send as a file with `.ovpn` extension to user.

### Revoke clients (if compromised)

To revoke client if needed use this script:
```sh
./remove_client.sh unique_client_name
```

## Connect to VPN with new vpn configuration

### MacOS

Author recommendes to use - https://tunnelblick.net/ client. ([OpenVPN Connect](https://openvpn.net/client-connect-vpn-for-mac-os/) was not working on my mac)

### Ubuntu

Official guide - https://help.ubuntu.com/stable/ubuntu-help/net-vpn-connect.html.en

### Windows 7/10

(Was not tested by author)

- 7 - http://www.freeproxy.ru/ru/vpn/windows-7/openvpn.htm
- 10 - https://www.securevpn.pro/rus/setup/windows-10-openvpn-vpn?url=rus%2Fsetup%2Fwindows-10-openvpn-vpn
