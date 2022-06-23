#to find wheather there is lxdbr0

ip a | grep -w lxdbr0 && echo "lxdbr0 found succesfully" || echo "not found"


#to launch a container
lxc list | grep -w COMP2101-S22 | echo $? | read VAR

if [ "$VAR" -gt 0 ]
then
	echo "container exists"
fi


#to install apache2 
lxc exec COMP2101-S22 -- apt-get install apache2 | echo $? |read VAR

if [ "$VAR" -gt 0 ]
then
	echo "apache2 is already installed"
fi


#to find wheather there is curl

if [-f /usr/bin/curl ]
then
	echo "curl found"
else
	sudo apt install curl
fi


