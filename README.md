# dynamic_ip_getter
A bash  script to get the dynamic public IP address pushed on a private github repo each time it changes.

I had to write this script, when i needed to connect with ssh to my Raspberry PI  at home, but it had a dynamic public IP address. So by this script, whenever i want to connect to it, i have just to check the private repo and take the address then connect.

It requires ssh authentication in github, you may check this [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).
