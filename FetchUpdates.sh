#!/bin/bash -xe

sudo echo "Executing $0 $1 $2 $3 $4 $5 $6 $7 $8 $9"
cd $HOME

declare -a file_url
declare -a file_name
declare -a file_acl
declare -a file_own
declare -a file_result

file_url[9]="https://raw.githubusercontent.com/gjwdyk/PublicKeys/main/JigokuShoujo43x25.text"
file_name[9]="$HOME/JigokuShoujo43x25.text"
file_acl[9]="644"
file_own[9]="ubuntu:ubuntu"

file_url[0]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/id_rsa"
file_name[0]="$HOME/.ssh/id_rsa"
file_acl[0]="600"
file_own[0]="ubuntu:ubuntu"

file_url[1]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/id_rsa.pub"
file_name[1]="$HOME/.ssh/id_rsa.pub"
file_acl[1]="644"
file_own[1]="ubuntu:ubuntu"

file_url[2]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/id_rsa.pub"
file_name[2]="$HOME/.ssh/authorized_keys"
file_acl[2]="600"
file_own[2]="ubuntu:ubuntu"

file_url[3]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/VMPrepOS.sh"
file_name[3]="$HOME/PrepareOS.sh"
file_acl[3]="777"
file_own[3]="ubuntu:ubuntu"

file_url[4]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/VMPrepContainerRuntimeInterface.sh"
file_name[4]="$HOME/PrepareContainerRuntimeInterface.sh"
file_acl[4]="777"
file_own[4]="ubuntu:ubuntu"

file_url[5]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/VMPrepCommonK8s.sh"
file_name[5]="$HOME/PrepareCommonK8s.sh"
file_acl[5]="777"
file_own[5]="ubuntu:ubuntu"

file_url[6]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/VMPrepK8sMaster.sh"
file_name[6]="$HOME/PrepareK8sMaster.sh"
file_acl[6]="777"
file_own[6]="ubuntu:ubuntu"

file_url[7]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/VMPrepK8sWorker.sh"
file_name[7]="$HOME/PrepareK8sWorker.sh"
file_acl[7]="777"
file_own[7]="ubuntu:ubuntu"

file_url[8]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/PrepApplicationService.sh"
file_name[8]="$HOME/PrepareApplicationService.sh"
file_acl[8]="777"
file_own[8]="ubuntu:ubuntu"

file_url[9]="https://raw.githubusercontent.com/gjwdyk/NGINX-Notes/main/NMS-Instance-Manager/K8sServer/JigokuShoujo43x25.text"
file_name[9]="$HOME/JigokuShoujo43x25.text"
file_acl[9]="644"
file_own[9]="ubuntu:ubuntu"

max_counter=9

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

kubectl get node -o wide
kubectl get pod --all-namespaces -o wide
kubectl get service --all-namespaces -o wide

cat $HOME/JigokuShoujo43x25.text

#╔═════════╗
#║   End   ║
#╚═════════╝
