all:
	ansible-playbook -i inventory.yaml playbook.yaml  --ask-vault-password

dmgwsl:
	ansible-playbook playbook-heitec-arch.yaml  --ask-vault-password -v

dmg:
	ansible-playbook playbook-heitec-hyperv-arch.yaml  --ask-vault-password

dmgprofile:
	ansible-playbook playbook-heitec-profile.yaml -v

lilith:
	ansible-playbook playbook-lilith-arch.yaml

lilithwsl:
	ansible-playbook playbook-lilwsl.yaml

lilithprofile:
	ansible-playbook playbook-lilithprofile.yaml --ask-become-pass

req:
	ansible-galaxy install -r requirements.yaml -f
