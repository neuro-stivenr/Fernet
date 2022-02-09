REPODIR=$(shell pwd)

default: env fernet.sh

env:
	python3 -m venv env
	env/bin/pip install --upgrade pip
	env/bin/pip install --upgrade setuptools wheel
	env/bin/pip install -r requirements.txt

fernet.sh:
	@echo '#!/bin/sh' > fernet.sh
	@echo '' >> fernet.sh
	@echo "$(REPODIR)/env/bin/python $(REPODIR)/fernet.py" >> fernet.sh

.PHONY: clean
clean:
	rm -rf env
	rm fernet.sh
