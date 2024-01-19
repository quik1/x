
#!/bin/bash

# Check available units
sudo systemctl list-units --all

# Option to enable all services
read -p "Do you want to enable all services? (Y/n): " enable_all
enable_all=${enable_all:-Y}  # Default to 'Y' if user presses Enter
if [ "$enable_all" == "Y" ]; then
    sudo systemctl enable --now --all
else
    # Option to start and enable a specific service
    read -p "Enter the name of the service to start and enable: " service_name
    sudo systemctl start "$service_name"
    
    # Check if --now option should be used
    read -p "Do you want to enable the service with --now option? (Y/n): " enable_now
    enable_now=${enable_now:-Y}  # Default to 'Y' if user presses Enter
    if [ "$enable_now" == "Y" ]; then
        sudo systemctl enable --now "$service_name"
    else
        sudo systemctl enable "$service_name"
    fi

    # Check the status of the activated service
    sudo systemctl status "$service_name"
fi

# Allow SSH traffic through UFW
sudo ufw allow ssh

# Display IP addresses
ip a
