# ansible-prometheus

This project combines playbooks from various sources including 
[cloudalchemy](https://github.com/cloudalchemy) to provision one or all of the following services:
* Prometheus server
* Node exporter
* MySQL exporter
* JMX exporter for Tomcat services

Tests have been done on Linux CentOS 7 with the following versions of applications and databases:
- MariaDB 5.5.64
- Apache Tomcat/7.0.76

Adjustments might be required to work with other versions.

## Pre-requisites

- Install [ansible](https://docs.ansible.com)

```bash
$ brew install ansible
```

## Hosts Configuration

The list of Prometheus servers, MySQL servers and Tomcat servers can be individually specified in 
the [hosts](hosts) file.  Examples can be found in the file.
 
## Other Configuration

All other configuration is done in the [vars/main.yml](vars/main.yml).  Here are the must-config's:

### SSH Access
For SSH access to the remote hosts, you must specify your SSH public key in the `auth_key` variable.

### MySQL Server Credentials
A mysql user will be created for the mysql exporter to connect to the mysql server.  The 
specified credentials are used to create such a user in mysql. 

### Prometheus Scrape Configs
If installing a Prometheus server, please fill in the `prometheus_scrape_configs` section in the
[vars/main.yml](vars/main.yml).  Simply replace the HOST1, MYSQL_HOST2, TOMCAT_HOST3, 
etc. placeholders with corresponding real host names or IPs.

In the future, this scrape configs section will be auto-generated from the [hosts](hosts) file.

## Provisioning

See the [Makefile](Makefile), or simply run
```bash
make
```

## Contributing

Have an idea? Want to fix something?

Clone this project, make your changes, and submit a [Merge Request](https://docs.gitlab.com/ee/user/project/merge_requests/).
