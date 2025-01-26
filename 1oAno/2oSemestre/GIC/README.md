### Install Vagrant
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

### Install VirtualBox
```
sudo apt-get install virtualbox
```

### Create VM
```
mkdir vagrant-vm1
cd vagrant-vm1

vagrant init hashicorp/bionic64
```

### Run VM
```
vagrant up
```

### Access VM
```
vagrant ssh
```

### Delete VM
```
vagrant remove

vagrant destroy

vagrant box list
vagrant box remove hashicorp/bionic64
```

### Configuration VM
```
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
end
```
```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/noble64"
end
```

### Configuring Apache
```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/noble64"

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
  SHELL
end
```

### Run docker in VM
```
docker build -t app:v1 .
```
app:v1 will be the internal name of the docker image


### Pull from prof and run
```
docker pull registry.deti/prof/app:v3
docker run -p 8081:8080 -ti registry.deti/prof/app:v3
```
It will run in the 192.168.56.10 ip and port 8081

### Push to registry
```
docker build -t registry.deti/g9/app:v1 .
docker push registry.deti/g9/app:v1
```

### Build docker with docker file
```
docker build -t cherrypy_app -f Dockerfile.app .
```

### Build docker compose
```
docker compose up
```

### kubernetes create namespace
```
kubectl create namespace gic-98083
```

### push to namespace
```
kubectl apply -f deployment.yaml -n gic-98083
```

### workflow
```
docker build -t registry.deti/gic-98083/app:v1 .
docker push registry.deti/gic-98083/app:v1
kubectl apply -f deployment.yaml -n gic-98083
```
