#!/bin/bash

terraform_outputs=`cd ../terraform; terraform output`
gitlab_ip=`echo "$terraform_outputs" | grep external_ip_address_gitlab | awk '{print $3}'`
output_ip="{\"_meta\":{\"hostvars\":{}},\"vm-gitlab\":{\"hosts\":[$gitlab_ip]}}"
echo $output_ip
