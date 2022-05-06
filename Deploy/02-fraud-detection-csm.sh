#!/bin/bash


CLUSTERNAME=$(basename $0)
CLUSTERNAME=${CLUSTERNAME:9:${#CLUSTERNAME}-12}    # MacOs uses bash 3.x - cant use substitution in bash 4.x

echo "Creating : $PREFIX-$CLUSTERNAME"

cdp datahub create-aws-cluster \
--cluster-name ${PREFIX}-${CLUSTERNAME} \
--environment-name ${ENVIRONMENT} \
--cluster-template-name "7.2.14 - Streams Messaging Light Duty: Apache Kafka, Schema Registry, Streams Messaging Manager, Streams Replication Manager, Cruise Control" \
--instance-groups nodeCount=3,instanceGroupName=core_broker,instanceGroupType=CORE,instanceType=m5.2xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=1000,volumeCount=1,volumeType=st1\}\],recoveryMode=MANUAL nodeCount=0,instanceGroupName=broker,instanceGroupType=CORE,instanceType=m5.2xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=1000,volumeCount=1,volumeType=st1\}\],recoveryMode=MANUAL nodeCount=1,instanceGroupName=master,instanceGroupType=GATEWAY,instanceType=r5.2xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=100,volumeCount=1,volumeType=standard\}\],recoveryMode=MANUAL \
--image id=2b194ebb-b8d4-4f7f-a352-f7a8e15059a1,catalogName=cdp-default \
--datahub-database NON_HA 

