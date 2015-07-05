# database_tests
Codes for database subject final work, and maybe I can expand this... probably not hahaha

#compilation
gcc -I "/usr/include/mysql" -o file $(mysql_config --cflags) file.c $(mysql_config --libs)
