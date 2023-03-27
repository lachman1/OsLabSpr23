#!/bin/bash

# Get network information
network_info=$(ifconfig)

# Define email details
to_address="lachmand26@gmail.com"
subject="Network information"
body="Here's the network information for the system:\n\n$network_info"

# Send email
echo -e "$body" | mailx -s "$subject" "$to_address"
