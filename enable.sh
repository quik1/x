#!/bin/bash

# Check SSH service status
sudo systemctl status ssh

# Allow SSH traffic through UFW
sudo ufw allow ssh

# Display IP addresses
ip a
