gswd-liam
=========

++ vagrant + chef + django ++

requires virtualbox & vagrant

```bash
$ vagrant up
$ vagrant ssh
vagrant@precise64:~$ source blog-venv/bin/activate
(blog-venv)vagrant@precise64:~$ cd /vagrant/project/microblog/
(blog-venv)vagrant@precise64:/vagrant/project/microblog$ python manage.py runserver 0.0.0.0:8000
```

goto 127.0.0.1:8888 in a browser.
