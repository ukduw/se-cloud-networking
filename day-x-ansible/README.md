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


## Use
- Uses **YAML "playbooks"** (task automation):
![Ansible YAML anatomy](diagrams/ansible-yaml-anatomy.png)

- Uses **agentless architecture**, so can communicate with devices without requiring an application or service to be installed on the managed node.
    - Uses **SSH** (or **WinRM for windows**) to connect remotely to systems without installing software on them


### Tasks
- Tasks can include:
    - Provisioning servers
    - Managing updates
    - Automating workflows across different systems


