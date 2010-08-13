#!/usr/bin/expect

# Expect script intendend to further automate Linode Aegir StackScipt
# http://www.linode.com/stackscripts/view/?StackScriptID=203

set timeout 20 # die after 20 seconds

# Get arguments
set script [lindex $argv 0]
set aegir_hostname [lindex $argv 1]
set email [lindex $argv 2]
set password [lindex $argv 3]

# Spawn aegir install script
spawn sh $script $aegir_hostname --client_email=$email
# Automate user input
expect "Please answer yes or no"
send "Y"
expect "You will be asked to enter your mysql root user password now :"
send "$password"

# Give control back to the user
interact