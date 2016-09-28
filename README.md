# Development box with ansible, fabric, nvim and tmux
This is still in progress.

It's my setup that I can start in Windows through Vagrant.

It installs Fabric and Ansible when provisioned. The ansible playbook is in dev-machine.yml
and can be provisioned with:
```bash
fab setup
```

From nvim then, run :PlugInstall to get plugins.

Currently Scala Activator is added. Please run sudo apt-get install -y sbt
as there is an issue with the sbt install from Ansible.

Then you can call fab activator_ui to get activator on localhost:8888.
This uses an hardcoded ip I got from ifconfig and is not a general solution.

I use gnome-terminal to get a terminal on my Xming.

To use tmux, tmuxp is installed with a small setup. It can be loaded with tmuxp load dev.
