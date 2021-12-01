# Powering on or shutting down VM's for your particular resource group. Written in bash

#!/bin/bash

printf "\n>>> Would you like to shutdown or power on your VMs?\nType[shut, start]>> "
read choice

printf "\n*** List of Resource Groups in your Azure Subscription ***\n"
az group list --output table

answer_choice () {
    if [[ $choice == "shut" ]]
    then
        printf "\n### Please provide the name of your Resource Group to shutdown your VM's ###\n>>> "
        read usershut
        printf "\n### Shutting down VMs in $usershut ###\n"
        az vm deallocate --ids $(az vm list --query "[].id" --resource-group $usershut -o tsv)
        printf "\n*** Complete! ***\n"
        exit

    elif [[ $choice == "start" ]]
    then
        printf "\n### Please provide the name of your Resource Group to power on your VM's ###\n>>> "
        read userstart
        printf "\n### Powering on VMs for $userstart ###\n"
        az vm start --ids $(az vm list --query "[].id" --resource-group $userstart -o tsv)
        printf "\n*** Complete! ***\n"
        exit
        fi
}
