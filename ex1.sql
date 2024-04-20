mysql> use centre_formation;
Database changed
mysql> create user User1@localhost
    -> identified by 'Modep@sse1';
Query OK, 0 rows affected (0.05 sec)

mysql> create user User2@localhost
    -> identified by 'Modep@sse2';
Query OK, 0 rows affected (0.01 sec)

mysql> create user User3@localhost
    -> identified by 'Modep@sse3';
Query OK, 0 rows affected (0.01 sec)

mysql> create user User4@localhost
    -> identified by 'Modep@sse4';
Query OK, 0 rows affected (0.01 sec)

mysql> select user from mysql.user;
+------------------+
| user             |
+------------------+
| Saad             |
| User1            |
| User2            |
| User3            |
| User4            |
| mysql.infoschema |
| mysql.session    |
| mysql.sys        |
| root             |
+------------------+
9 rows in set (0.00 sec)

mysql> GRANT SELECT ON CENTRE_FORMATION.* TO User1@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT INSERT ON CENTRE_FORMATION.session TO User2@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT INSERT ON CENTRE_FORMATION.INSCRIPTION TO User2@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON CENTRE_FORMATION.* TO User3@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT UPDATE ON CENTRE_FORMATION.INSCRIPTION TO User4@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW GRANTS FOR 'User1'@'localhost';
+-------------------------------------------------------------+
| Grants for User1@localhost                                  |
+-------------------------------------------------------------+
| GRANT USAGE ON *.* TO `User1`@`localhost`                   |
| GRANT SELECT ON `centre_formation`.* TO `User1`@`localhost` |
+-------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR 'User2'@'localhost';
+-------------------------------------------------------------------------+
| Grants for User2@localhost                                              |
+-------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `User2`@`localhost`                               |
| GRANT INSERT ON `centre_formation`.`inscription` TO `User2`@`localhost` |
| GRANT INSERT ON `centre_formation`.`session` TO `User2`@`localhost`     |
+-------------------------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR 'User3'@'localhost';
+---------------------------------------------------------------------+
| Grants for User3@localhost                                          |
+---------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `User3`@`localhost`                           |
| GRANT ALL PRIVILEGES ON `centre_formation`.* TO `User3`@`localhost` |
+---------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR 'User4'@'localhost';
+-------------------------------------------------------------------------+
| Grants for User4@localhost                                              |
+-------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `User4`@`localhost`                               |
| GRANT UPDATE ON `centre_formation`.`inscription` TO `User4`@`localhost` |
+-------------------------------------------------------------------------+
2 rows in set (0.00 sec)

PS C:\Program Files\MySQL\MySQL Server 8.0\bin> .\mysql -u User4 -p
Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use centre_formation;
Database changed

mysql> update inscription
    -> set typecours = 'Présentiel'
    -> where codesess = 1101 and nom_cinetu = 'y1234987';
ERROR 1143 (42000): SELECT command denied to user 'User4'@'localhost' for column 'codesess' in table 'inscription'

mysql> exit
Bye

PS C:\Program Files\MySQL\MySQL Server 8.0\bin> .\mysql -u root -p
Enter password: ***
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> REVOKE DELETE ON CENTRE_FORMATION.*
    -> FROM 'User3'@'localhost';
Query OK, 0 rows affected (0.02 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)