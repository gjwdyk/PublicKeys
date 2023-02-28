#!/bin/bash -xe

sudo echo "Executing $0 $1 $2 $3 $4 $5 $6 $7 $8 $9"
cd $HOME

sudo mkdir $HOME/PublicKeys
cd $HOME

declare -a file_url
declare -a file_name
declare -a file_acl
declare -a file_own
declare -a file_result

file_url[0]="https://raw.githubusercontent.com/gjwdyk/PublicKeys/main/JigokuShoujo43x25.text"
file_name[0]="$HOME/JigokuShoujo43x25.text"
file_acl[0]="644"
file_own[0]="ubuntu:ubuntu"

file_url[1]="https://apt.grafana.com/gpg.key"
file_name[1]="$HOME/PublicKeys/AptGrafanaCom_GpgKey"
file_acl[1]="644"
file_own[1]="ubuntu:ubuntu"

file_url[2]="https://artifacts.elastic.co/GPG-KEY-elasticsearch"
file_name[2]="$HOME/PublicKeys/ArtifactsElasticCo_GpgKeyElasticsearch"
file_acl[2]="644"
file_own[2]="ubuntu:ubuntu"

file_url[3]="https://cs.nginx.com/static/files/90pkgs-nginx"
file_name[3]="$HOME/PublicKeys/CsNginxCom_StaticFiles_90PkgsNginx"
file_acl[3]="644"
file_own[3]="ubuntu:ubuntu"

file_url[4]="https://cs.nginx.com/static/keys/app-protect-security-updates.key"
file_name[4]="$HOME/PublicKeys/CsNginxCom_StaticKeys_AppProtectSecurityUpdates.key"
file_acl[4]="644"
file_own[4]="ubuntu:ubuntu"

file_url[5]="https://cs.nginx.com/static/keys/nginx_signing.key"
file_name[5]="$HOME/PublicKeys/CsNginxCom_StaticKeys_NginxSigning.key"
file_acl[5]="644"
file_own[5]="ubuntu:ubuntu"

file_url[6]="https://download.docker.com/linux/ubuntu/gpg"
file_name[6]="$HOME/PublicKeys/DownloadDockerCom_LinuxUbuntu_gpg"
file_acl[6]="644"
file_own[6]="ubuntu:ubuntu"

file_url[7]="https://nginx.org/keys/nginx_signing.key"
file_name[7]="$HOME/PublicKeys/NginxOrg_Keys_NginxSigning.key"
file_acl[7]="644"
file_own[7]="ubuntu:ubuntu"

file_url[8]="https://packages.cloud.google.com/apt/doc/apt-key.gpg"
file_name[8]="$HOME/PublicKeys/PackagesCloudGoogleCom_AptDoc_AptKey.gpg"
file_acl[8]="644"
file_own[8]="ubuntu:ubuntu"

max_counter=8

URLRegEx="^(http:\/\/|https:\/\/)?[a-z0-9]+((\-|\.)[a-z0-9]+)*\.[a-z]{2,}(:[0-9]{1,5})?(\/.*)*$"

for counter in $(seq 0 $max_counter) ; do
 if [[ ${file_url[$counter]} =~ $URLRegEx ]] ; then
  file_result[$counter]=$(/usr/bin/curl -fksSL --retry 333 -w "%{http_code}" ${file_url[$counter]} -o ${file_name[$counter]})
  if [[ ${file_result[$counter]} == 200 ]] ; then
   echo "$counter ; HTTP ${file_result[$counter]} ; ${file_name[$counter]} download complete."
   chown ${file_own[$counter]} ${file_name[$counter]}
   chmod ${file_acl[$counter]} ${file_name[$counter]}
  else
   echo "$counter ; HTTP ${file_result[$counter]} ; Failed to download ${file_name[$counter]} ; Continuing . . ."
  fi
 else
  echo "$counter ; Reference to the ${file_name[$counter]} was not a URL ; Continuing . . ."
 fi
done

#╔═══════════════════╗
#║   Review Status   ║
#╚═══════════════════╝

cat $HOME/JigokuShoujo43x25.text

#╔═════════╗
#║   End   ║
#╚═════════╝
