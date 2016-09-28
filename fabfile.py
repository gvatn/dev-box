from fabric.api import run, sudo, local

def ensure_ansible():
    local('sudo /vagrant/internal-ansible.sh')

def setup():
    local('sudo ansible-playbook --inventory="localhost," -c local /vagrant/dev-machine.yml')

def activator_ui():
    """
    Assuming vagrant, find ip address
    with ifconfig
    """
    local('activatorui -Dhttp.address=10.0.2.15')
