#!/bin/bash

show_progress()
{
  echo -n "Starting"
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
  echo "Configured"
}

show_progress