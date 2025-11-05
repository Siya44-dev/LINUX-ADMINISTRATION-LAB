# ============================================
# USER MANAGEMENT COMMANDS
# ============================================

# Adding Users
# ------------

# Add a new user with default settings
sudo useradd username

# Add user with home directory and bash shell
sudo useradd -m -s /bin/bash username

# Add user with specific UID and comment
sudo useradd -u 1500 -c "Full Name" username

# Add user and create home directory with custom location
sudo useradd -m -d /home/custompath/username username

# Set password for new user
sudo passwd username

# Deleting Users
# --------------

# Delete user (keeps home directory)
sudo userdel username

# Delete user and remove home directory
sudo userdel -r username

# Force delete user even if logged in
sudo userdel -f username

# Modifying Users
# ---------------

# Change username
sudo usermod -l newname oldname

# Change user's home directory
sudo usermod -d /new/home/path username

# Change user's shell
sudo usermod -s /bin/zsh username

# Lock a user account
sudo usermod -L username

# Unlock a user account
sudo usermod -U username

# Add user to supplementary group
sudo usermod -aG groupname username

# Change user's primary group
sudo usermod -g groupname username

# ============================================
# GROUP MANAGEMENT COMMANDS
# ============================================

# Adding Groups
# -------------

# Create a new group
sudo groupadd groupname

# Create group with specific GID
sudo groupadd -g 2000 groupname

# Create system group
sudo groupadd -r groupname

# Deleting Groups
# ---------------

# Delete a group
sudo groupdel groupname

# Modifying Groups
# ----------------

# Change group name
sudo groupmod -n newgroupname oldgroupname

# Change group GID
sudo groupmod -g 3000 groupname

# ============================================
# PERMISSION MANAGEMENT COMMANDS
# ============================================

# Using chmod (Change File Permissions)
# --------------------------------------

# Symbolic Mode:

# Add execute permission for user
chmod u+x filename

# Remove write permission for group
chmod g-w filename

# Add read permission for others
chmod o+r filename

# Set read and write for user, read for group and others
chmod u=rw,go=r filename

# Add execute permission for all
chmod a+x filename

# Remove all permissions for others
chmod o-rwx filename

# Numeric Mode:

# rwxr-xr-x (755)
chmod 755 filename

# rw-r--r-- (644)
chmod 644 filename

# rwx------ (700)
chmod 700 filename

# rw------- (600)
chmod 600 filename

# rwxrwxrwx (777) - everyone can do everything
chmod 777 filename

# Recursive permission change
chmod -R 755 directory/

# ============================================
# SPECIAL PERMISSION BITS
# ============================================

# Set SUID (Set User ID) - 4000
chmod u+s filename
chmod 4755 filename

# Set SGID (Set Group ID) - 2000
chmod g+s filename
chmod 2755 filename

# Set Sticky Bit - 1000 (for directories)
chmod +t directory
chmod 1777 directory

# Remove special permissions
chmod u-s filename
chmod g-s filename
chmod -t directory

# ============================================
# USING chown (Change Ownership)
# ============================================

# Change file owner
sudo chown username filename

# Change file owner and group
sudo chown username:groupname filename

# Change only group
sudo chown :groupname filename

# Recursive ownership change
sudo chown -R username:groupname directory/

# Change owner using UID
sudo chown 1000 filename

# ============================================
# USING chgrp (Change Group)
# ============================================

# Change file's group
sudo chgrp groupname filename

# Recursive group change
sudo chgrp -R groupname directory/

# ============================================
# USING setfacl (Set File Access Control Lists)
# ============================================

# Give user read and write access
setfacl -m u:username:rw filename

# Give group read and execute access
setfacl -m g:groupname:rx filename

# Remove ACL for specific user
setfacl -x u:username filename

# Remove all ACLs
setfacl -b filename

# Set default ACL for directory (inherited by new files)
setfacl -d -m u:username:rwx directory/

# Recursive ACL setting
setfacl -R -m u:username:rx directory/

# Copy ACLs from one file to another
getfacl file1 | setfacl --set-file=- file2

# Grant specific user access to a file using ACL
setfacl -m u:collaborator:rw document.txt

# ============================================
# VIEWING ACLs
# ============================================

# View ACLs of a file
getfacl filename

# View ACLs recursively
getfacl -R directory/

# ============================================
# VIEWING INFORMATION COMMANDS
# ============================================

# View current user
whoami

# View user information
id username

# View all groups user belongs to
groups username

# View all users
cat /etc/passwd

# View all groups
cat /etc/group

# View file permissions
ls -l filename

# View file permissions with ACLs
ls -la filename

# View detailed user information
finger username

# ============================================
# PRACTICAL EXAMPLES
# ============================================

# Create a new user with full setup
sudo useradd -m -s /bin/bash -c "John Doe" -G sudo,developers john
sudo passwd john

# Set up a shared directory for a group
sudo groupadd project_team
sudo mkdir /shared/project
sudo chown :project_team /shared/project
sudo chmod 2775 /shared/project
sudo usermod -aG project_team user1
sudo usermod -aG project_team user2

# Secure a private file
touch private.txt
chmod 600 private.txt