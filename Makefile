HOSTNAME := $(shell hostnamectl --static)

default:
	ansible-galaxy install -r requirements.yaml -f --ignore-errors
	ansible-playbook playbook-$(HOSTNAME).yaml --ask-vault-password

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

thyri:
	ansible-playbook playbook-thyri-arch.yaml -v

thyri_aur:
	ansible-playbook playbook-thyri-arch.yaml -v -e aur=true

lilithwsl:
	ansible-playbook playbook-lilwsl.yaml

lilithprofile:
	ansible-playbook playbook-lilithprofile.yaml --ask-become-pass

zprofile:
	ansible-playbook playbook-zprofile.yaml --ask-become-pass

req:
	ansible-galaxy install -r requirements.yaml -f --ignore-errors

zphone:
	ansible-playbook playbook-zphone.yaml -v


