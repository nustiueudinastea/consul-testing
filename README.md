consul-testing
==============

This is a small environment for testing and playing with Consul, a service discovery tool made by the HashiCorp folks.

It is also the basis for this presentation: http://www.slideshare.net/nustiueudinastea/service-discovery-in-docker-environments

Run Consul
==========

Use the privided consulcfg.json configuration. It sets up DNS listening on port 53, hence the required sudo command.

```
sudo ./consul agent -server -bootstrap -data-dir ./consuldata/ -config-file ./consulcfg.json -client=172.17.42.1
```

The "-client" directive tells Consul on which ip to listen. Since we want all the Docker containers to be able to access the Consul services on their default gateway we used the IP address from the docker0 interface.

Build and run the containers
============================

The containers that offer services automatically register with Consul so that other containers can find them. Look in dockerfiles/git/bin/init.sh for an example.

Also check the start scripts for each container to see how to configure the DNS server for each container.
