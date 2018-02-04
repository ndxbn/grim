# grim
build the sitri@ndxbn development environment.

## How to push box?
see https://www.vagrantup.com/docs/vagrant-cloud/boxes/create.html

I push vagrant box manualy.

## How to generate .box file?

```bash
git clone https://github.com/ndxbn/grim
cd grim
vagrant up
vagrant package
```

After command, "package.box" file is generated.
