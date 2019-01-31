# access-mysql

Este código converte um arquivo accdb ou mdb no formato Mysql. Ou seja, nesta funcionalidade o banco inteiro e convertido, porém é necessário criar um banco de dados vazio em Mysql para que esta possiblidade seja viável.

Entretanto esta funcionalidade é compatível apenas com Linux.

Passos para conversão de accdb para um banco em mysql:

1) Instale:

sudo apt-get install mdbtools
sudo apt-get install mysql-server

2) Execução do projeto:

./accessmy.sh [arquivo do banco no formato accdb ou mdb] [arquivo do banco em mysql]

Exemplo:
./accessmy.sh Banco_Access.accdb MySqlDatabase

