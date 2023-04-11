dmg:
	sudo ansible-playbook playbook-dmgdebian.yaml

lilwsl:
	sudo ansible-playbook playbook-lilwsl.yaml

dmgprofile:
	ansible-playbook playbook-dmgprofile.yaml --ask-become-pass

req:
	ansible-galaxy install -r requirements.yaml
