# ping_docker
A simple docker to ensure that a given docker_network is working.

Instructions:

Use this in a docker_composefile as a means to document whether a docker_network is working or not.

The docker is used in the compose file like so:
</code>
ping_docker:
  container_name: ping_docker
  image: smathev/ping_docker:latest
   restart: "no"
   network_mode:
        "service:'the_VPN_docker you want to verify for being up or down'"
    volumes:
  # Config:
        - 'Host-Mount for config dir':/config:rw
</code>
The container will then, every 10 minutes check for connection to google.com, and if it is there will create (or leave) a file called "working" in the config-dir. Furthermore it will document in /config/log when it was run. If the connection is not there, it will remove the "working"-file.

You can then take action, based on the "working"-file being present or not. I for instance restart my VPN-docker from the host-system, when the "working"-file isn't present anymore.
