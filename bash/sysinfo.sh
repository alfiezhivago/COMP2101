#my system informatiom

#to display hostname
Myhostname=$(hostname)

#by using hostname parameter to get domain name
Domain_Name=$(hostname -d)

#to get operating system and version
OS=$(lsb_release -ds)

#to get ip address
ip_address=$(hostname -I)

#to print the disk usage
filesystem=$(df -h | grep /dev/sda3 | awk '{print $4}')

cat <<EOF

Report for $Myhostname
======================================

Domain Name        :$Domain_Name
Operating System And version :$OS
Ip Address :$ip_address
Root FIlesystem Free Space:$filesystem

======================================
EOF
