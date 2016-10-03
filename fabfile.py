from __future__ import with_statement
from fabric.api import run, sudo, local, hide

def ensure_ansible():
    local('sudo /vagrant/internal-ansible.sh')

def setup():
    local('sudo ansible-playbook --inventory="localhost," -c local /vagrant/dev-machine.yml')

def activator_ui():
    """
    Assuming vagrant, find ip address
    with ifconfig
    http://bplawler.tumblr.com/post/124256974918/typesafe-activator-on-a-vagrant-vm
    """
    local('activator ui -Dhttp.address=10.0.2.15')
