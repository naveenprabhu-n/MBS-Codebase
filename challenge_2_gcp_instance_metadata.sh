#gcloud command is an easy way to get the details of any GCP service


#The below command gives the metadata of all details associated with the VM in a "json" format. 
#Replace $vm_instance_name with name of the instance and $zone with GCP zone for the VM

gcloud compute instances describe $vm_instance_name --format="json" --zone=$zone


#BONUS : To retrieve value for a particular data key individually, we can tweak, the describe command to fetch the output in "value" format, 
#Replace $vm_instance_name with name of the instance and $key with the specific data key you want to fetch the value for.

gcloud compute instances describe $vm_instance_name --format="value(metadata.items.$key.value)" --zone=$zone
