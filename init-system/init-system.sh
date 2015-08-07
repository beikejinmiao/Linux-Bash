#!/bin/bash
#***
## init the system sets
#***

##detect the user logined
user=$(id | awk -F '(' '{print $2}' | awk -F ')' '{print $1}')
if [ "$user" != "root" ]; then 
    echo "Please execute this shell under user of 'root'!"
    echo "Now the user logined is '$user'"
    exit 0
fi

##ssh set
mkdir -p $HOME/.ssh
cd $HOME/.ssh/
if [ ! -e authorized_keys ]; then
    touch authorized_keys
fi
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0G0Y9KLGVZxR3BrcKCwv7HnBAW2z2nYPiurw/vnJ2h8dxDRoY83HTH26gyD/Bnu8EclqI0CdFcgQZBDH5BnsFPFtMeoxgNYV5kxdYZ9xxilm7HwBOD0YrJT+W5GM4PLIGF2y8XipPH3g+gPzPbBmRkyM7EosM5iSVJ4yTkK8QwJCz75jkGjfC5wNs6+xIQx5zfFW7lo0JvmTaMrjkQ3LVpb24Z3AnOofJfrF7vrdbICh1ZxqWNpvEoUvv6Hvuui6Y9tRguD0v0ZIuFXy9lUK03xi/BX5Pfwrji+v9TCtVwBDD9lz83nWmBCr5hOTyCoItS+Q8GAE/OOo2bN9v3Zw2Q== root@niehz-dev" >> authorized_keys


##vim set
if [ ! -e $HOME/.vimrc ]; then
    touch $HOME/.vimrc
fi
vimrc_path="$HOME/.vimrc"
echo "set nocompatible" 	>  $vimrc_path
echo "filetype on" 		    >> $vimrc_path
echo "syntax on" 		    >> $vimrc_path
echo ":filetype indent on" 	>> $vimrc_path
echo "set et" 			    >> $vimrc_path
echo "set ci" 			    >> $vimrc_path
echo "set shiftwidth=4" 	>> $vimrc_path
echo "set number" 		    >> $vimrc_path
echo "" >> $vimrc_path
echo ":set ts=4" 		    >> $vimrc_path 
echo "set expandtab" 		>> $vimrc_path
echo ":%retab!" 		    >> $vimrc_path
echo ":set modifiable" 		>> $vimrc_path
echo "" >> $vimrc_path
echo "map <F3> :NERDTreeMirror<CR>" >> $vimrc_path
echo "map <F3> :NERDTreeToggle<CR>" >> $vimrc_path


##apt set
if [ ! -d /etc/apt ]; then
    mkdir -p /etc/apt
fi
cd /etc/apt/
source_filename="sources.list"
if [ -e $source_filename ]; then
    mv $source_filename $source_filename".bak"
fi
touch $source_filename


deb_url="ftp://ftp.ustb.edu.cn/pub/ubuntu/"
ubuntu_release_name="trusty"
deb_url_head="deb $deb_url $ubuntu_release_name"
debsrc_url_head="deb-src $deb_url $ubuntu_release_name"
deb_url_end="main restricted universe multiverse"
source_type="security updates proposed backports"

echo ${deb_url_head}" "${deb_url_end} > $source_filename
for stype in $source_type
do
    echo ${deb_url_head}"-"${stype}" "${deb_url_end} >> $source_filename
done

echo "" >> $source_filename
echo ${debsrc_url_head}" "${deb_url_end} >> $source_filename
for stype in $source_type
do
    echo ${debsrc_url_head}"-"${stype}" "${deb_url_end} >> $source_filename
done


##restart some services
service ssh restart
