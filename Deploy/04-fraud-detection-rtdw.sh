#!/bin/bash


CLUSTERNAME=$(basename $0)
CLUSTERNAME=${CLUSTERNAME:9:${#CLUSTERNAME}-12}    # MacOs uses bash 3.x - cant use substitution in bash 4.x

echo "Creating : ${PREFIX}-${CLUSTERNAME}"

cdp datahub create-aws-cluster \
--cluster-name ${PREFIX}-${CLUSTERNAME} \
--environment-name ${ENVIRONMENT} \
--cluster-template-name "7.2.14 - Real-time Data Mart: Apache Impala, Hue, Apache Kudu, Apache Spark" \
--instance-groups nodeCount=1,instanceGroupName=master1,instanceGroupType=GATEWAY,instanceType=r5.2xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=100,volumeCount=1,volumeType=standard\}\],recoveryMode=MANUAL,volumeEncryption=\{enableEncryption=false\} nodeCount=1,instanceGroupName=master3,instanceGroupType=CORE,instanceType=r5.2xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=100,volumeCount=1,volumeType=standard\}\],recoveryMode=MANUAL,volumeEncryption=\{enableEncryption=false\} nodeCount=1,instanceGroupName=coordinator,instanceGroupType=CORE,instanceType=i3.4xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=1900,volumeCount=2,volumeType=ephemeral\}\],recoveryMode=MANUAL,volumeEncryption=\{enableEncryption=false\} nodeCount=1,instanceGroupName=master2,instanceGroupType=CORE,instanceType=r5.2xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=100,volumeCount=1,volumeType=standard\}\],recoveryMode=MANUAL,volumeEncryption=\{enableEncryption=false\} nodeCount=3,instanceGroupName=executor,instanceGroupType=CORE,instanceType=i3.4xlarge,rootVolumeSize=100,attachedVolumeConfiguration=\[\{volumeSize=1900,volumeCount=2,volumeType=ephemeral\}\],recoveryMode=MANUAL,volumeEncryption=\{enableEncryption=false\} \
--image id=2b194ebb-b8d4-4f7f-a352-f7a8e15059a1,catalogName=cdp-default 

