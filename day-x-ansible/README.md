# Ansible
- Open-souroce automation tool
    - Server **Config management**
    - **App deployment** (and updates), including database and environment variable configurations
    - **Orchestration**, automating multi-step processes across machines
    - **Cloud provisioning**
    - **Network automation**
    - **CI/CD**, automating testing, building, deploying apps

- **Declarative**: complex tasks are carried out via readable YAML "playbooks"
    - **Idempotent**, supporting various platforms and cloud environments - run same playbook = same resulting state


## Anatomy
### Uses **YAML "playbooks"** (task automation):
![Ansible YAML anatomy](diagrams/ansible-yaml-anatomy.png)
- `ansible-playbook-ex.yaml` (refer to file...):
```
---
- name: Install nginx on web server
  hosts: webservers   # specifies which group of machines playbook applies to
  become: yes   # runs tasks as sudo
  tasks:  # list of steps to be executed
    - name: Install nginx
      apt:  # ansible module for managing packages on debian-based systems
        name: nginx
        state: present
    - name: Start nginx service
      service:  # ansible module for managing system services
        name: nginx
        state: started
```

### Uses **agentless architecture**, so can communicate with devices without requiring an application or service to be installed on the managed node.
- **SSH** (or **WinRM for windows**) to connect remotely to systems without installing software on them

### Uses an **inventory file** to define which systems to be managed, e.g.:
```
[webservers]
url.example1.com
url.example2.com

[dbservers]
db.example1.com
```


## Use
```
sudo apt install ansible
ansible-playbook -i inventory_file ansible-playbook-ex.yaml
```
- **Ad-hoc command** to check a service is running on remote server (checks if `nginx` is running on all `webservers`):
```
ansible webservers -i inventory_file -m service -a "name=nginx state=started"
```

### Common Ansible modules
- **apt**: Manages packages on Debian-based systems
- **yum**: Manages packages on RedHat-based systems
- **service**: Manages system services (start, stop, restart)
- **copy**: Copies files from local machine to remote server
- **file**: Manages file properties (permissions, ownership...)
- **user**: Creates or manages user accounts
- **git**: Manages git repos
- Example:



### Tasks
- Tasks can include:
    - Provisioning servers
    - Managing updates
    - Automating workflows across different systems


