# virsh actions for quick VM deployment locally on KVM

Some quick notes, mostly to remind myself how to do this.

## TOC
* [Use](#Use)
* [Host os](#Host-os)


## Use

    
````sh
sudo virt-install --name ansible-runner --description "ansible-runner" --ram 2048  --vcpus 2 --disk path=/STUFF/ansible-runner-disk1.qcow2,size=15 --disk path=/STUFF/ansible-runner-disk2.qcow2,size=55  --os-type linux  --os-variant "rhl9" --network bridge=virbr0 --graphics vnc,listen=127.0.0.1,port=5901  --location /STUFF/rhel-baseos-9.0-x86_64-dvd.iso --noautoconsole --extra-args="inst.ks=http://192.168.122.1:8081/kickstart-minimal.cfg"

````

---

## Host OS

Running this on a RHEL 8 system.
The `--extra-args="inst.ks"` is required to make this work

---

## kickstart-minimal

## starting a webserver to host the kickstart file


````sh
    python3 -m http.server 8081

````

---

## Reminder for myself to produce code blocks in README 

````
    use ctrl+v for VIM block mode
    use shift+i to enable insert mode for block mode
    press space to indent
    use esc esc to fill out the pace indent

````

## find IP address based on Mac Address in ARP cache

````sh
for server in ansible-runner server{a..d}; do sudo virsh dumpxml $server \
| grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' \
| xargs -I '{}' sh -c 'arp -a | grep {}' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" \
| xargs -I '{}' echo "{} $server"; done

````

````
    [sudo] password for hans: 
    192.168.122.101 ansible-runner
    192.168.122.127 servera
    192.168.122.38 serverb
    192.168.122.73 serverc
    192.168.122.17 serverd
````

## add the IP address and hostname to /etc/hosts
Delete it first of it's already there

````sh
sudo sed -E -i '/.*server.*|.*ansible-runner.*/d' /etc/hosts

for server in ansible-runner server{a..d}; do sudo virsh dumpxml $server \
| grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' \
| xargs -I '{}' sh -c 'arp -a | grep {}' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" \
| xargs -I '{}' echo "{} $server" \
| sudo  tee --append /etc/hosts; done
````
