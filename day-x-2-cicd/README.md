# Continuous Integration / Continuous Delivery/Deployment (CI/CD)
Set of DevOps practices **automating the software delivery process**
- From code changes to deployment
- Allows for **faster, more frequent, more reliable software releases** via...
- **Automated builds, tests, deployments**

**CI focuses on merging code often, while CD handles releasing that tested code...**
- **Manually (Delivery)**
- Or, **automatically (Deployment)**

CI/CD key advantages:
- Faster releases
- More frequent testing (so typically less bugs)
- Better collaboration and fast feedback loops
- Reduced risk due to smaller, more frequent changes (as opposed to large, infrequent changes)


# CI/CD Pipeline
![CI/CD Pipeline diagram](diagrams/CICD-Pipeline.webp)


### Continuous Integration (CI)
In practice, this means **developers merge code changes into main repo frequently**
- **Each merge triggers an automated build and test sequence**
    - Allows for quick fixes and a stable codebase

### Continuous Delivery (CD)
This is the **automation of the release of built and tested code**
- Automation means the **code is always in a deployable, production-ready state**
    - The final deployment to production may still require a manual approval

### Continuous Deployment (CD)
A step further than Delivery, this **automates the Deployment of every change that passes all stages of the pipeline to production**.
    - Release happens automatically
    - **Maximizes speed and efficiency** in getting newly developed features/fixes to users


## Common CI/CD Tools
Gitlab CI/CD (CI/CD)
- Built into GitLab repo ecosystem
- Auto DevOps templates, strong runner ecosystem
- Can have steep learning curve, runner management overhead balloons at scale

Github Actions (CI/CD, tied to git workflows)
- Integrated CI/CD within GitHub
    - Native, no need for separate server
- Marketplace of reusable actions, simple YAML workflows, strong branch/pull request triggers
- Less mature CD features, can become costly at scale

Jenkins (CI + basic CD)
- One of the oldest, most widely used open-source automation servers
    - Best when you need full control, customization, and open-source
- Flexible, thousands of plugins, technology-agnostic
- Somewhat outdated compared to modern tools, maintenance overhead, can be slow/brittle at scale

AWS CodePipeline/Build/Deploy
- placeholder

Azure DevOps
- placeholder




### placeholder



## Use
`code here`

```
codeblock
```


### placeholder





