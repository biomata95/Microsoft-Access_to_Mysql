TABLES=$(mdb-tables -1 $1) # A variável recebe a lista de todas as tabelas do banco em Access. Através do comando mdb-tables. No qual o primeiro argumento representa o banco em Access

MUSER="root" # Username da conta em mysql
MPASS="root" # Username da conta em mysql
MDB="$2"

MYSQL=$(which mysql) # Caminho para o arquivo binario do mysql

for t in $TABLES # Loop para percorrer as tabelas, incluindo a verificação da existencia de alguma tabela com mesmo nome no banco de destino(Em MYSQL). Se já existe deleta a tabela.
do
    $MYSQL -u $MUSER -p$MPASS $MDB -e "DROP TABLE IF EXISTS $t"
done

mdb-schema $1 mysql | $MYSQL -u $MUSER -p$MPASS $MDB # Extração das características do esquema do banco em access

for t in $TABLES # Inserção dos dados do access para o banco em Mysql
do
    mdb-export -D '%Y-%m-%d %H:%M:%S' -I mysql $1 $t | $MYSQL -u $MUSER -p$MPASS $MDB
done