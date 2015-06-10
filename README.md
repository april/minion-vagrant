# minion-vagrant
Vagrantfile to make developing against Mozilla Minion far easier.

Mozilla Minion is available:
* https://github.com/mozilla/minion
* https://github.com/mozilla/minion-backend
* https://github.com/mozilla/minion-frontend

# To configure:
* Edit the BACKEND\_SRC and FRONTEND\_SRC variables in `Vagrantfile` to point to their locations on your local system
* Edit the IP addresses in `Vagrantfile` and `hosts.sh` if you want your private network to use something besides 192.168.50.49 and 192.168.50.50
* Edit `backend.sh` to change the default administrator's email address and name

# To run:
* `vagrant up`

That's it!  You can ssh into your new (and hopefully fully-functioning) Minion instances with `vagrant ssh minion-frontend` and `vagrant ssh minion-backend`.

You can access the minion-frontend site at http://192.168.50.50:8080 (or whatever you set the IP to)
