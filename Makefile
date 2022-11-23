all:
	ansible-playbook -i inventory.yaml playbook.yaml  --ask-vault-password

dmg:
	sudo ansible-playbook playbook-dmgdebian.yaml

dmgprofile:
	ansible-playbook playbook-dmgprofile.yaml --ask-become-pass

req:
	ansible-galaxy install -r requirements.yaml
