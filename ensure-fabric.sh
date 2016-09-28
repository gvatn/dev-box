#!/bin/bash
apt-get update
apt-get install -y python-dev python-setuptools  python-pip \
	libffi6 libffi-dev \
	openssl libssl-dev
pip install pycrypto cryptography paramiko invoke fabric cuisine