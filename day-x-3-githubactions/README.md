# GitHub Actions (CI)
GitHub's **built-in automation platform** and can handle full CI/CD. It allows workflows to be **run automatically when certain events happen** in a given **repository**, for example:
- **Pushing code**
- **Opening a pull request**
- Creating a release

Actions can also be triggered via **schedule** (e.g. cron), or **manually**   
Because Actions is **GitHub-native**, there's **no need for a separate server**, and is **tightly integrated with PRs, commits and releases**.


### Workflows
A **workflow** is the **top-level automation**, defined in **YAMLs** in `.github/workflows/`   
Workflows can:
- **Build**
- **Test**
- **Lint** (automated analysis of code, flagging errors, sylistic problems, suspicious constructs... before execution)
- Package
- Release
- Deploy

...the code in the repo
- Reminder: CI is when changes to repo trigger automated build and test process

A **job** is a **set of steps that run on the same machine**
- Jobs **can run parallel or depend on each other**
- Each job runs a new **runner**

A **step** is a **single task**, e.g.
- Run a shell command
- Use an **action** (prebuilt automation)

An **action** is a **reusable unit of logic**
- Can be GitHub- or community-written
- e.g. `actions/checkout`, `actions/setup-node`, `docker/build-push-action`

A **runner** is **the machine that executes jobs**
- **GitHub-hosted** (Ubuntu, Windows, macOS) - has time limits...
- Or, **self-hosted**


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


### YAML (CI example)
Refer to `github-actions-ci-example.yml`   
```
name: CI

on:
  pull_request:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20

      - run: npm install
      - run: npm test
```
- Triggered on PR or push (to main)
- Runs on ubuntu
- Checks code and sets up node.js
- Installs dependencies and runs tests

