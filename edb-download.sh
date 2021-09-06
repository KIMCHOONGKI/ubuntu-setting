# Install the repository configuration
yum -y install https://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm

# Replace 'USERNAME:PASSWORD' below with your username and password for the EDB repositories
# Visit https://www.enterprisedb.com/user to get your username and password
sed -i "s@<username>:<password>@edbpartneraccess:qDFyx6dchSkDnRXT@" /etc/yum.repos.d/edb.repo

# Install EPEL repository
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install selected packages
yum -y install edb-as11-server 

# Initialize Database cluster
PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as11/bin/edb-as-11-setup initdb

# Start Database cluster
systemctl start edb-as-11

# Connect to the database server
# sudo su - enterprisedb
# psql postgres

