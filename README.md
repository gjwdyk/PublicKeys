# Public Keys

This repository contains copies of Public Keys which are needed to do installations.
Sometimes, the maintainer of the key(s) would have some issue, and you'd end up ***wasting time waiting*** for them to fix the issue; and this is without possibilities to shout at them to let them know the issue and/or to urge them to pace themselves.

Obviously, this repository should be considered only as BACKUP, and NOT rely on this repositry for completeness NOR up to date information.

So instead of the usual (example) :

```
let counter=0;while ( (sudo lsof /var/cache/apt/archives/lock) || (sudo lsof /var/lib/apt/lists/lock) || (sudo lsof /var/lib/dpkg/lock*) || ((`(ps aux -A | grep -i -c "apt")` > 1)) );do let counter++;echo "$counter";if (sudo lsof /var/cache/apt/archives/lock);then printf "$counter sudo lsof /var/cache/apt/archives/lock\n`sudo lsof /var/cache/apt/archives/lock`\n";fi;if (sudo lsof /var/lib/apt/lists/lock);then printf "$counter sudo lsof /var/lib/apt/lists/lock\n`sudo lsof /var/lib/apt/lists/lock`\n";fi;if (sudo lsof /var/lib/dpkg/lock*);then printf "$counter sudo lsof /var/lib/dpkg/lock*\n`sudo lsof /var/lib/dpkg/lock*`\n";fi;if ((`(ps aux -A | grep -i -c "apt")` > 1));then printf "$counter ps aux -A | grep -i \"apt\"\n`ps aux -A | grep -i \"apt\"`\n";fi;sleep 1s;done
sudo curl -fksSL --retry 333 https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Use the `if` branch as below, to test in case the original key's repository is available or not :

```
let counter=0;while ( (sudo lsof /var/cache/apt/archives/lock) || (sudo lsof /var/lib/apt/lists/lock) || (sudo lsof /var/lib/dpkg/lock*) || ((`(ps aux -A | grep -i -c "apt")` > 1)) );do let counter++;echo "$counter";if (sudo lsof /var/cache/apt/archives/lock);then printf "$counter sudo lsof /var/cache/apt/archives/lock\n`sudo lsof /var/cache/apt/archives/lock`\n";fi;if (sudo lsof /var/lib/apt/lists/lock);then printf "$counter sudo lsof /var/lib/apt/lists/lock\n`sudo lsof /var/lib/apt/lists/lock`\n";fi;if (sudo lsof /var/lib/dpkg/lock*);then printf "$counter sudo lsof /var/lib/dpkg/lock*\n`sudo lsof /var/lib/dpkg/lock*`\n";fi;if ((`(ps aux -A | grep -i -c "apt")` > 1));then printf "$counter ps aux -A | grep -i \"apt\"\n`ps aux -A | grep -i \"apt\"`\n";fi;sleep 1s;done
if ( sudo curl -fksSL https://download.docker.com/linux/ubuntu/gpg ) ; then
 sudo curl -fksSL --retry 333 https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
else
 sudo curl -fksSL --retry 333 https://raw.githubusercontent.com/gjwdyk/PublicKeys/DownloadDockerCom_LinuxUbuntu_gpg | sudo apt-key add -
fi
```

Of course, after a while key(s) may got expired, and you need to update.
And yeah, no one will set a side time to do update, when things are running well and OK.
But updating during the original key's repository is unavailable, would be pointless, right?

You can, if you're lucky, go to [Wayback Machine](https://web.archive.org/).






