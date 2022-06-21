#my system informatiom
echo -----------------------------------System information--------------------------------------

#to display hostname
echo "Host Name:" $(hostname)

echo Operating System name and version:

cat /etc/os-release | grep -w PRETTY_NAME=
#to see ipv4 and used grep to select a particular line. then used awk to grab second word
echo "Ip Address:" $(ip a s ens33 | grep -w inet | awk '{print $2}')
#to see amount of space available in the root file,displayed in human readable form
echo "Root Filesystem Status:"

df -h | grep -w Filesystem

df -h | grep -w /dev/sda3
