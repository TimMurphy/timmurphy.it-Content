cinst git

close & open cmd
git config --global push.default simple

## ssh

Open git bash

    ssh -v to ensure ssh is installed.
    ls -a ~/.ssh if "No such file or directory" then continue

### ssh-keygen

ssh-keygen
enter for default file name.
enter for empty passphrase.
empty passphrase again.

ls  ~/.ssh to ensure you now have id_rsa & id_rsa.pub

### BitBucket

Open git bash
notepad ~/.ssh/config to create new file.

Add:

    Host bitbucket.org 
     IdentityFile ~/.ssh/id_rsa
 
The space on second line is important.

Close and reopen git bash

notepad ~/.bashrc to create new file.

    SSH_ENV=$HOME/.ssh/environment
       
    # start the ssh-agent
    function start_agent {
        echo "Initializing new SSH agent..."
        # spawn ssh-agent
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
        echo succeeded
        chmod 600 ${SSH_ENV}
        . ${SSH_ENV} > /dev/null
        /usr/bin/ssh-add
    }
       
    if [ -f "${SSH_ENV}" ]; then
         . ${SSH_ENV} > /dev/null
         ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
        }
    else
        start_agent;
    fi

Close and reopen git bash

todo:
Update bitbucket site.
Update repostiroy config.


## GitHub

cinst githubforwindows



## References:

- https://confluence.atlassian.com/display/BITBUCKET/Use+the+SSH+protocol+with+Bitbucket
- https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git
