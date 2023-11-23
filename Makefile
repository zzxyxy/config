all:
	ansible-playbook -i inventory.yaml playbook.yaml  --ask-vault-password

dmgwsl:
	ansible-playbook playbook-heitec-arch.yaml

dmg:
	ansible-playbook playbook-heitec-hyperv-arch.yaml

dmgprofile:
	ansible-playbook playbook-heitec-profile.yaml

lilith:
	ansible-playbook playbook-lilith-arch.yaml

lilithwsl:
	ansible-playbook playbook-lilwsl.yaml

lilithprofile:
	ansible-playbook playbook-lilithprofile.yaml --ask-become-pass

req:
	ansible-galaxy install -r requirements.yaml -f
