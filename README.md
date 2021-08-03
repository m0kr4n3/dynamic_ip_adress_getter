# dynamic_ip_adress_getter
A bash  script to get the dynamic public IP adress pushed on a private github repo each time it changes.

I had to write this script, when i needed to connect with ssh to my Raspberry PI place at home, but it has a dynamic public IP adress, so by this script, whenever i want to connect to it, i have just to check the private repo and take the adress then connect.

It requires putting github credentials on ~/.git-credentials to be able to push to the main.
