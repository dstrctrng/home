---
layout: documentation
title: Documentation - Vagrantfile

current: Vagrantfile
---
# Vagrantfile

The Vagrantfile is a Ruby file used to configure Vagrant on a per-project basis.
The main function of the Vagrantfile is to described the virtual machines required
for a project as well as how to configure and provision these machines. Although
the contents of a Vagrantfile are Ruby, knowledge of Ruby is not necessary to make
modifications to the file since it is mostly simple variable assignment.

Vagrantfiles are meant to be committed directly to version control and are expected
to behave identically on any system which runs Vagrant. The idea is that when a
developer checks out some code from version control which has a Vagrantfile, that
developer can simply `vagrant up` to get a fully provisioned virtual environment
to develop that product.

## Vagrantfile Load Order

An important concept to understand is how Vagrant loads the Vagrantfile. Actually,
there are a series of Vagrantfiles that Vagrant will load. Each subsequent Vagrantfile
loaded will override any settings set previously. The Vagrantfiles that are loaded
and the order they're loaded is shown below:

1. Vagrantfile from the gem directory is loaded. This contains all the defaults
  and should never be edited.
1. Vagrantfile from the box directory is loaded if a box is specified. This is the
   Vagrantfile that is packaged with the box if you use the `--vagrantfile` option
   when packaging.
1. Vagrantfile from the home directory (defaults to `~/.vagrant.d/`) is loaded if it exists.
   This Vagrantfile allows you to set some defaults that may be specific to your
   user.
1. Vagrantfile from the project directory is loaded. This is typically the
   file that users will be touching.

Therefore, the Vagrantfile in the project directory overwrites any conflicting
configuration from the home directory which overwrites any conflicting configuration
from a box which overwrites any conflicting configuration from the default file.

## Vagrantfile Options

There are many options available to configure Vagrant. These options include specifying
the box to use, shared folders, networking configuration, etc. All the available
configuration options are listed below. Click on any for more details of that specific
option.

<ul class="nav nav-tabs nav-stacked">
	<li><a href="../docs/config/nfs/map_uid.html">config.nfs.map_uid</a></li>
	<li><a href="../docs/config/vm/provision.html">config.vm.provision</a></li>
	<li><a href="../docs/config/vm/share_folder.html">config.vm.share_folder</a></li>
</ul>
