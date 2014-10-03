How to load the test data into your db locally

Steps 1 - 3 may not be necessary if you already have user created but don't have db created

1. Create a mysql user with a password and all privileges. Or use root if you have a password setup(for phpMyAdmin)
	mysql -uroot -p
		password:{root password or blank if no password}
	CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';  // note,you do need to type the '' single quotes
	GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' WITH GRANT OPTION;
2. login to mysql in terminal window
	mysql -u{user} -p
		password:{your password}
3. delete the old database
	drop database dbname;

4. Create a new database
	create database dbname; // may want to add "CHARACTER SET UTF8" to end of this statement

NOTE: With the new DML.sql we do not need to use the "python manage.py syncdb" command
5. Now we need to insert the data from DML.sql into the db that was created
	OPTION 1:
		From shell:
			shell> mysql dbname < DML.sql // if you are in same directory as DML.sql

	OPTION 2:
		From MySQL prompt
			mysql> use dbname;
			mysql> source DML.sql;

	OPTION 3:
		If logged into phpMyAdmin
			Select database along left hand side(database should be empty)
			Click on Import tab on the top
			Browse for file DML.sql
			Click on GO button

Next:
	Make sure that your settings.py in the django project is set to use dbname, user, password