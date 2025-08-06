#!/bin/bash

echo "Node Name               Internal IP"
echo "---------------------------------------"

kubectl get nodes -o wide | awk 'NR==1 {next} {printf "%-25s %s\n", $1, $6}'
