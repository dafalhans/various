#/bin/bash
sudo virt-install --name ansible-runner --description "ansible-runner" --ram 2048  --vcpus 2 --disk path=/STUFF/ansible-runner-disk1.qcow2,size=15 --disk path=/STUFF/ansible-runner-disk2.qcow2,size=55  --os-type linux  --os-variant "rhl9" --network bridge=virbr0 --graphics vnc,listen=127.0.0.1,port=5901  --location /STUFF/rhel-baseos-9.0-x86_64-dvd.iso --noautoconsole --extra-args="inst.ks=http://192.168.122.1:8081/kickstart-minimal.cfg"

sudo virt-install --name servera --description "servera" --ram 2048  --vcpus 2 --disk path=/STUFF/servera-disk1.qcow2,size=15 --disk path=/STUFF/servera-disk2.qcow2,size=55  --os-type linux  --os-variant "rhl9" --network bridge=virbr0 --graphics vnc,listen=127.0.0.1,port=5902  --location /STUFF/rhel-baseos-9.0-x86_64-dvd.iso --noautoconsole --extra-args="inst.ks=http://192.168.122.1:8081/kickstart-minimal.cfg"

sudo virt-install --name serverb --description "serverb" --ram 2048  --vcpus 2 --disk path=/STUFF/serverb-disk1.qcow2,size=15 --disk path=/STUFF/serverb-disk2.qcow2,size=55  --os-type linux  --os-variant "rhl9" --network bridge=virbr0 --graphics vnc,listen=127.0.0.1,port=5903  --location /STUFF/rhel-baseos-9.0-x86_64-dvd.iso --noautoconsole --extra-args="inst.ks=http://192.168.122.1:8081/kickstart-minimal.cfg"

sudo virt-install --name serverc --description "serverc" --ram 2048  --vcpus 2 --disk path=/STUFF/serverc-disk1.qcow2,size=15 --disk path=/STUFF/serverc-disk2.qcow2,size=55  --os-type linux  --os-variant "rhl9" --network bridge=virbr0 --graphics vnc,listen=127.0.0.1,port=5904  --location /STUFF/rhel-baseos-9.0-x86_64-dvd.iso --noautoconsole --extra-args="inst.ks=http://192.168.122.1:8081/kickstart-minimal.cfg"

sudo virt-install --name serverd --description "serverd" --ram 2048  --vcpus 2 --disk path=/STUFF/serverd-disk1.qcow2,size=15 --disk path=/STUFF/serverd-disk2.qcow2,size=55  --os-type linux  --os-variant "rhl9" --network bridge=virbr0 --graphics vnc,listen=127.0.0.1,port=5905  --location /STUFF/rhel-baseos-9.0-x86_64-dvd.iso --noautoconsole --extra-args="inst.ks=http://192.168.122.1:8081/kickstart-minimal.cfg"

