# Octoprint

An application to control (usb) 3d-printers over the network.

- send .stl over the network (no sd cards needed)
- setup and control the print
- monitor the progress of ongoing prints (optionally, webcams can be added to see the visual state)

## Multi printer support

- Octoprint only supports one printer per instance
- in order to support multiple printers, we can deploy multiple docker containers
- the different printers can then be assigned to their respective instance
- this example sets up 2 instances for 2 priners, modify it to your needs

## Requirements

- Debian/Ubuntu based host (RPi, Laptop, ...)
- one USB port per 3d printer
- Recommended: network connectivity to host (if not, only local control possible)
- Optionally: one webcam per 3d-printer (needs additional USB ports)
- Recommended: ssh enabled on host (needed for ansible deployment)
- Docker installed [manual install](https://docs.docker.com/engine/install/ubuntu/) / (ansible playbook)
- Optionally: Portainer installed [manual install](https://docs.portainer.io/start/install-ce/server/docker/linux) / (ansible playbook)

## Deploy Octoprint with 2 printers

- Reference: https://github.com/OctoPrint/octoprint-docker

### Deploy with Ansible

- playbook for automated octoprint install: work in progress

### Manual deployment

- modify docker-compose.yml according to your printers and webcams
- make sure each instance uses it's own port
- deploy the compose file on the hosts Portainer

Without Portainer:

- copy the compose file to /srv/docker/octoprint/docker-compose.yml on the host
- `cd /srv/docker/octoprint`
- start the containers with `sudo docker compose up -d`
- check if containers are running `sudo docker ps`
- check for any errors with `sudo docker compose logs -f`
