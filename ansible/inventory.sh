#!/bin/bash

terraform_outputs=`cd ../terraform/stage; terraform output`
app_ip=`echo "$terraform_outputs" | grep external_ip_address_app | awk '{print $3}'`
db_ip=`echo "$terraform_outputs" | grep external_ip_address_db | awk '{print $3}'`
output_ip="{\"_meta\":{\"hostvars\":{}},\"db\":{\"hosts\":[$db_ip]},\"app\":{\"hosts\":[$app_ip]}}"
echo $output_ip
