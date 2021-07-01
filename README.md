# Dockerfile for robot framework

This project consists of a Docker image containing a Robot Framework installation.

## Versioning

### Python

* python=3.9.6

### Library

* robotframework==3.2.1
* robotframework-seleniumlibrary==5.1.3
* robotframework-selenium2library==3.0.0
* robotframework-appiumlibrary==1.5.0.6
* RESTinstance==1.0.2
* robotframework-jsonlibrary==0.3
* robotframework-seleniumtestability==1.1.0
* robotframework-robocop==1.4.1
* robotframework-pabot==2.0.0
* robotframework-requests==0.9.1
* robotframework-databaselibrary==1.2.4

### Browser

* google-chrome-stable=latest
* chromedriver=91.0.4472.101

## How to use

### Docker
```bash
docker run --user=1001:1001 dylanngo/robot:latest
```

### Gitlab CI

Copy to file .gitlab-ci.yml

```bash
image: dylanngo/robot

before_script:
  - python --version
  - python -m pip list

stages:
  - test

executing-test:
  stage: test
  script:
    - robot --console verbose --outputdir ./reports ./testcases/example.robot
  artifacts:
    when: always
    paths:
      - ./reports
    expire_in: 1 week
```