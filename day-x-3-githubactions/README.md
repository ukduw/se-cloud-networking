# GitHub Actions (CI)
GitHub's **built-in automation platform** and can handle full CI/CD. It allows workflows to be **run automatically when certain events happen** in a given **repository**, for example:
- **Pushing code**
- **Opening a pull request**
- Creating a release

Actions can also be triggered via **schedule** (e.g. cron), or **manually**   
Because Actions is **GitHub-native**, there's **no need for a separate server**, and is **tightly integrated with PRs, commits and releases**.


### Workflows
Workflows can:
- **Build**
- **Test**
- **Lint** (automated analysis of code, flagging errors, sylistic problems, suspicious constructs... before execution)
- Package
- Release
- Deploy

...the code in the repo
- Reminder: CI is when changes to repo trigger automated build and test process


### Overview
```
Developer pushes code (event)

GitHub Actions runs CI
- install dependencies
- run tests
- run linters

If successful, run CD
- build artifacts (output files during build process)
- deploy to staging / production
```


### placeholder
placeholder
- placeholder


