# Jenkins Configuration

## Installation

- choco install git-credential-winstore (probably optional)
- choco install git
- choco install gitpad (probably optional)
- choc install jenkins
- [Install any updates](http://localhost:8080/updateCenter/)

## Jenkins - Plugins

- [Install Plugins](http://localhost:8080/pluginManager/available)
    - BitBucket Plugin

## [Jenkins - Configure](http://localhost:8080/configure)

- Jenkins URL: **change to current computer name. e.g. http://buildserver:8080/**
- System Admin e-mail address: **tim@26tp.com**
- E-mail Notification: **Click advanced button so gmail settings can be entered.**

## croquetscores.com Configuration

- New Item
    - Screen 1
        - Item name: **croquetscores.com**
        - Select **Freestyle project**
    - Screen 2
        - Source Code Management: **Git**
        - Repository URL: **https://bitbucket.org/FollowScores/croquetscores.com.git**
        - Credentials: **required**
        - Branch Specifier (blank for 'any'): **<<remove default setting>>**
        - Tick **Build when a change is pushed to BitBucket**
        - Execute Windows batch command: .\Scripts\Build.bat Compile
    