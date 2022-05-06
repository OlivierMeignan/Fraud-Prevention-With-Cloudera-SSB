#!/bin/bash


# Delete Datahub clusters

egrep "cdp datahub create" *.sh | cut -d: -f1 | grep -v destroy-all.sh | while read NAME
do 
  CLUSTERNAME=${NAME:9:${#NAME}-12}
  echo "Deleting cluster : ${PREFIX}-${CLUSTERNAME}"
  cdp datahub delete-cluster --cluster-name=${PREFIX}-${CLUSTERNAME}
done

