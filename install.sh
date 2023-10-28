#!/bin/bash
# Script to install rsshr - https://github.com/w6w/rsshr

func_def(){
if [[ "$USER" != "root" ]] ; then
    echo -e "\n\tYou must be \"root\" to install this program, you are trying to run this installer with user \"$(whoami)\" ."
    echo -e "\n\tUse the \"su\" command to become root or try this:"
    echo -e "\n\tcd $(pwd) ; sudo $0\n"
    exit 1
fi
}

func_install(){
cp -v usr/bin/rsshr /usr/bin/ && { chown root.root /usr/bin/rsshr ; chmod 755 /usr/bin/rsshr ; }
cp -v etc/rsshr.conf /etc && { chown root.root /etc/rsshr.conf ; chmod 644 /etc/rsshr.conf ; }
mkdir -p /usr/share/man/man1 ; cp -v usr/share/man/man1/rsshr.1.gz /usr/share/man/man1/
}

func_uninstall(){
rm -v /usr/bin/rsshr /etc/rsshr.conf /usr/share/man/man1/rsshr.1.gz
}

## Main
if [[ "$1" == "--install" ]] ; then
    func_def ; func_install
else 
    [[ "$1" == "--uninstall" ]] && { func_def ; func_uninstall ; exit 0 ; }
    echo -e "\n\tUse:\n\tinstall.sh --install\n\tinstall.sh --uninstall\n\tinstall.sh --help\n" ; exit 1
fi
exit 0