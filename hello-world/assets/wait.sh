#!/bin/bash

show_progress()
{
  local -r pid="${1}"
  local -r delay='0.75'
  local spinstr='\|/-'
  local temp
  echo -n "Install in progress"
  while true; do 
    #sudo grep -i "done" /root/katacoda-background-finished &> /dev/null
    ls /root/.kube/config &> /dev/null
	if [[ "$?" -ne 0 ]]; then     
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
  done
  printf "    \b\b\b\b"
  echo ""
  echo "Installed!"
  
  echo -n "Nodes initialising"
  while true; do 
    #sudo grep -i "done" /root/katacoda-background-finished &> /dev/null
    JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}'
    NB_NODES=$(kubectl get nodes -o jsonpath="$JSONPATH" | grep "Ready=True" | wc -l)
    if [ $NB_NODES -lt 1 ]; then
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
  done
  printf "    \b\b\b\b"
  echo ""
  echo "Ready!"
  
  
}

show_progress