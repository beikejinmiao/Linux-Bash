#!/bin/bash
#***
## init the system sets
#***

##detect the user logined
#user=$(id | awk -F '(' '{print $2}' | awk -F ')' '{print $1}')
#if [ "$user" != "root" ]; then 
#    echo "Please execute this shell under user of 'root'!"
#    echo "Now the user logined is '$user'"
#    exit 0
#fi

##ssh set
echo "Add my secret key into ssh service."
echo

mkdir -p $HOME/.ssh
cd $HOME/.ssh/
if [ ! -e authorized_keys ]; then
    touch authorized_keys
fi
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0G0Y9KLGVZxR3BrcKCwv7HnBAW2z2nYPiurw/vnJ2h8dxDRoY83HTH26gyD/Bnu8EclqI0CdFcgQZBDH5BnsFPFtMeoxgNYV5kxdYZ9xxilm7HwBOD0YrJT+W5GM4PLIGF2y8XipPH3g+gPzPbBmRkyM7EosM5iSVJ4yTkK8QwJCz75jkGjfC5wNs6+xIQx5zfFW7lo0JvmTaMrjkQ3LVpb24Z3AnOofJfrF7vrdbICh1ZxqWNpvEoUvv6Hvuui6Y9tRguD0v0ZIuFXy9lUK03xi/BX5Pfwrji+v9TCtVwBDD9lz83nWmBCr5hOTyCoItS+Q8GAE/OOo2bN9v3Zw2Q== root@niehz-dev" >> authorized_keys


##vim set
echo "Reset my vim's set."
echo

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
echo "Would you want to alternate the apt's source of your system?"

read -p "Input 'Y' or 'y' for yes, 'N' or 'n' for no: " yn
if [ "${yn}" == "Y" -o "${yn}" == "y" ]; then
    source_file="/etc/apt/sources.list"
    
    if [ -e ${source_file} -a  ! -w ${source_file} ]; then
        echo "You have not the permission to wirte the $source_file"
        echo "Pleace use 'sudo'."
        exit 1
    fi

    if [ -e $source_file ]; then
        mv $source_file $source_file".bak"
    fi
    touch $source_file
    
    
    deb_url="ftp://ftp.ustb.edu.cn/pub/ubuntu/"
    #get the ubuntu release name by  `lsb_release`
    ubuntu_release_name=`lsb_release -a 2>&1 | grep 'Codename' | awk  '{print $2}'`
    deb_url_head="deb $deb_url $ubuntu_release_name"
    debsrc_url_head="deb-src $deb_url $ubuntu_release_name"
    deb_url_end="main restricted universe multiverse"
    source_type="security updates proposed backports"
    
    echo ${deb_url_head}" "${deb_url_end} > $source_file
    for stype in $source_type
    do
        echo ${deb_url_head}"-"${stype}" "${deb_url_end} >> $source_file
    done
    
    echo "" >> $source_file
    echo ${debsrc_url_head}" "${deb_url_end} >> $source_file
    for stype in $source_type
    do
        echo ${debsrc_url_head}"-"${stype}" "${deb_url_end} >> $source_file
    done
fi

echo
echo "Initialising the system end."
echo "Now restart some system service."

##restart some services
echo "***ssh"
sudo service ssh restart
