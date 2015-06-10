# minion-vagrant
Vagrantfile to make developing against Mozilla Minion far easier.

Mozilla Minion is available:
* https://github.com/mozilla/minion
* https://github.com/mozilla/minion-backend
* https://github.com/mozilla/minion-frontend

# To configure:
* Edit the IP addresses in `Vagrantfile` if you want to use something besides 192.168.50.49 and 192.168.50.50
* Edit `backend.sh` to change the default administrator's email address and name

# To run:
* `vagrant up`

That's it!  You can ssh into Minion instances with `vagrant ssh minion-frontend` and `vagrant ssh minion-backend`.

You can access the minion-frontend instance at http://192.168.50.50:8080 (or whatever you set the IP to)
