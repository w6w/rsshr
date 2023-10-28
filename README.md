# rsshr
Restricted shell to rsync over ssh

> Under construction  🚧

## About:

**RSSHR** - ("restricted shell to rsync over ssh") is an attempt to provide rsync over SSH access and limit the user's access to a shell in an SSH connection, preventing command execution on the remote system while allowing the user to synchronize their remote and local files using rsync over SSH (native to your system).

**RSSHR** - DOES NOT provide the connection or file manipulation resources. The **remote connection still needs to be provided by your system** through the **OpenSSH server and OpenSSH client** service, and **the file verification/transfer/synchronization features also need to be provided by your system** through the **rsync** application.

## Goals:

1. The first goal is to provide a means to prevent users from having access to a command terminal via SSH, restricting the connection only to file transfer through scp (native OpenSSH and can also be blocked) and rsync over SSH.

2. The second goal of rsshr is to be simple so that any user, even those with little technical knowledge, can make use of its functionality.

## Why rsync over SSH?

File synchronization with rsync offers a much richer set of features compared to file transfer with scp or sftp. However, this transfer is not encrypted, and as a result, the user's password on an rsync server is sent openly over the network. Using rsync over SSH corrects these characteristics but would naturally give the user access to a command shell on the remote machine. Rsshr attempts to prevent the user's access to a shell.

## Why not rsync alone?

Due to the lack of encryption in the transmission of passwords and files.

## Why not sftp/scp alone?

Due to the lack of advanced file synchronization/verification features.

## Do I need to make a drawing?

 _ |SSH|RSYNC|RSSHR
:------------------------------|:--------:|:--------:|:--------:
Encrypted password|x| |x
Encrypted traffic|x| |x
Advanced file synchronization| |x|x
No remote command terminal| |x|x


## Security:

With the unfortunate discontinuation of the rssh project [rssh](www.pizzashack.org/rssh/) in 2019, the idea behind rsshr is to try to fill this gap in the simplest way possible. Security tests are being assessed, and if possible, we will try to keep the program free from such vulnerabilities until the rsync application itself implements native encryption or OpenSSH implements something like "Subsystem rsync."

## To install:

**Automatically** - Just run the install.sh script<br>
git clone https://github.com/w6w/rsshr<br>
cd rsshr<br>
chmod +x install.sh<br>
./install.sh

**Manually** - Just download and copy files to:<br>
rsshr -> /usr/bin/rsshr<br>
rsshr.conf -> /etc/rsshr.conf<br>
rsshr.1.gz -> /usr/share/man/man1/rsshr.1.gz

## To use:
Change the user's default shell inside the "/etc/passwd" to "/usr/bin/rsshr" and allow the user only file transfers through rsync and sftp while denying a command execution shell.<br>
To change the location of logs or disallow SFTP, see "/etc/rsshr.conf" .


