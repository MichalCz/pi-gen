STH in Systemd on an image
============================

Here's a list of files to start STH as a service in Linux:

* start-sth - start script
* sth-config - the basic config for STH
* sth.service - the systemctl config file

Here's where these are installed.

| File                   | Destination
+------------------------+---------------------------------------
| start-sth              | /usr/bin/start-sth
| sth-config             | /etc/sth/sth-config
| sth.service            | /etc/systemd/system/sth.service
| sth-config-deploy.json | /opt/sth/deploy/conf/sth-config.json

