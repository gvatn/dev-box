from invoke import task, run
from os import system

@task
def bashrc(ctx):
    ctx.run("echo 'Hei'");
    system("echo 'Hei2'")
    system("cd /");

@task
def setup(ctx):
    ctx.run("""sudo ansible-playbook \
            --inventory="localhost," \
            -c local \
            /vagrant/dev-machine.yml""")
