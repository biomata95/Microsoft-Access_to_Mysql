TABLES=$(mdb-tables -1 $1) # The variable receives the list of all database tables in Access. Through the mdb-tables command. Where the first argument represents the database in Access

MUSER="root" # Username
MPASS="root" # Password
MDB="$2"

MYSQL=$(which mysql) # Path to mysql binary file

for t in $TABLES # Loop to go through the tables, including checking the existence of some table with the same name in the destination database (in MYSQL). If it already exists, delete the table.
do
    $MYSQL -u $MUSER -p$MPASS $MDB -e "DROP TABLE IF EXISTS $t"
done

mdb-schema $1 mysql | $MYSQL -u $MUSER -p$MPASS $MDB # Extraction of schema characteristics from the in-access bank

for t in $TABLES # Inserting access data to the database in Mysql
do
    mdb-export -D '%Y-%m-%d %H:%M:%S' -I mysql $1 $t | $MYSQL -u $MUSER -p$MPASS $MDB
done
