all:
	ansible-playbook -i inventory.yaml playbook.yaml  --ask-vault-password

dmg:
	sudo ansible-playbook playbook-heitec-arch.yaml

dmgprofile:
	ansible-playbook playbook-heitec-profile.yaml --ask-become-pass

lilith:
	sudo ansible-playbook playbook-lilith-arch.yaml

lilithwsl:
	sudo ansible-playbook playbook-lilwsl.yaml

lilithprofile:
	ansible-playbook playbook-lilithprofile.yaml --ask-become-pass

req:
	ansible-galaxy install -r requirements.yaml
