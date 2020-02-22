
install:
	OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook main.yml --forks 10

dry-run:
	OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook main.yml --forks 10 --check

monitoring_servers:
	OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook main.yml --forks 10 --limit 'prometheus_servers'

application_servers:
	OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook main.yml --forks 10 --limit 'tomcat_servers'

database_servers:
	OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ansible-playbook main.yml --forks 10 --limit 'mysql_servers'

requirements:
	ansible-galaxy install -r requirements.yml

.PHONY: requirements dry-run install database_servers application_servers monitoring_servers
