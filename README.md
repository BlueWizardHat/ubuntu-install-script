# ubuntu-install-script

Installation scrript for quickly getting a new ubuntu installation up and running.

This is an anonimized version of the script that I use when setting up a new ubuntu installation.

## Features

* Installs all the programs and dev-tools I use on a regular basis.
* Multiple Java JDKs installed side by side and quick switch between them with a jset alias
* Includes bash-git-prompt-hook

## Usage

Not all is installed from repos, you will need to download a few things first, create an "ansible-install" directory in your $HOME/Downloads and dump all files there.

* Any javas you want to install, edit roles/java-jdks/vars/main.yml so it fits with the ones you want, choose the tar archives when downloading
* Maven - download the tar archieve and edit roles/maven/vars/main.yml
* Gradle - download the "-all.zip" and edit roles/maven/vars/main.yml
* Eclipse - download the tar and edit roles/eclipse/vars/main.yml
* Lombok - this is for eclipse - download the jar and name it with it's proper version number, also edit roles/eclipse/vars/main.yml


Once things are downloaded start by updating your installation with

	sudo apt update && sudo apt full-upgrade -y

Then run the install-stuff.sh script and all will be installed.

Note that after the first time these scripts are run you will need to reboot for all the changes to take effect.


## Java JDKs and Tools

Java SDKs will be placed in /opt/java/jdks, this allows me to easy switch between versions (easier than the official way) and even run multiple different versions at the same time in different shells (the jset alias and script changes the Java version and vendor for a single shell).

Maven and Gradle are also installed under /opt/java/tools but symlinks are made in $HOME/.local/bin, again this is to ensure I can get the latest

Eclipse is installed in the users home directory under $HOME/.eclipse-bin, since the official repo is often out of date and you may need to install plugins. The is a symlink in $HOME/.local/bin for starting the eclipse via command line and a starteclipse script with some preferences preferred by me.

IntelliJ is installed via snap as that seems to be the newest version for now.


## Git

You might want to edit roles/dev-tools/files/conf/.gitconfig to put in your name and email.


## Have fun
