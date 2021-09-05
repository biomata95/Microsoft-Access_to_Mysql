# access-mysql

This code converts an accdb or mdb file into Mysql format. That is, in this functionality the entire database is converted, however it is necessary to create an empty database in Mysql so that this possibility is viable.

However this feature is only supported on Linux.
Banco_Access-Example.zip contains a database in access, with the Person and Property tables.

Steps for converting accdb to a mysql database:

1) Install:

sudo apt-get install mdbtools
sudo apt-get install mysql-server

2) Execution of project:

./accessmy.sh [database file in accdb or mdb format] [recipient bank on MySql]

Example:

./accessmy.sh Banco_Access.accdb MySqlDatabase

