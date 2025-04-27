•	Absolute Path:
This is the full path from the root of the file system to the file or folder.
It always starts from the root directory (like / in Linux/Mac or C:\ in Windows).

/home/user/Documents/report.txt
C:\Users\John\Documents\report.txt

•	Relative Path:
This is the path relative to your current location (called the working directory - pwd).
It does not start from the root.
Example (if you are already inside /home/user/):
Documents/report.txt

In short:
	•	Absolute path = full address
	•	Relative path = shortcut based on where you are now
---
mkdir cse3211
mkdir eyasir\ ahamed

cd eyasir\ ahamed

command
pwd(present working directory), mkdir(make directory/folder), ls
---
ls -l is a command in Linux/Unix that:
	•	ls lists files and directories.
	•	-l is the long listing option — it shows detailed information about each file.

When you run ls -l, you see something like this:

-rw-r--r--  1 user group  4096 Apr 27 10:00 myfile.txt

Each part means:
	•	-rw-r--r-- → file permissions
	•	1 → number of links
	•	user → owner
	•	group → group name
	•	4096 → file size (in bytes)
	•	Apr 27 10:00 → last modified date and time
	•	myfile.txt → file name

— let’s break down drwxrwxr-x:

This is file permission info shown by ls -l. Here’s what each part means:
	•	d → It’s a directory (if it was a file, it would be -).
	•	rwx → The owner has read (r), write (w), and execute (x) permissions.
	•	rwx → The group also has read, write, and execute permissions.
	•	r-x → Others (everyone else) have read and execute permissions, but no write permission.

In short:
Who	Permissions
Owner	read, write, execute
Group	read, write, execute
Others	read, execute
---
cd command
The cd command in an operating system (like Linux, MacOS, or Windows) is used to change the current directory.
	•	cd stands for change directory.

Examples:
	•	cd /home/user/Documents → Moves you to the Documents folder.
	•	cd .. → Moves you up one level (to the parent directory).
	•	cd ~ → Moves you to your home directory.
	•	cd / → Moves you to the root directory.

Very simple:
cd = move to another folder.
---
Here’s the quick explanation:
	•	ls -a
	Lists all files and folders, including hidden ones (those starting with a dot .).
	Example: shows .bashrc, .git, etc., which ls normally hides.

	•	ls -al
	Combines -a (all files) and -l (long listing format).
	So it shows all files (even hidden ones) with detailed information (permissions, owner, size, date, etc.).

In short:
Command	Meaning
ls -a	Show all files (even hidden)
ls -al	Show all files with full details
---
ls -R means:
	•	List all files and directories recursively.
	•	It shows the contents of the current directory and also all subdirectories inside it.

⸻

Example:

$ ls -R
.:
folder1  folder2  file1.txt

./folder1:
file2.txt

./folder2:
file3.txt

	•	. → current folder.
	•	./folder1: → inside folder1.
	•	./folder2: → inside folder2.

⸻

In short:
ls -R = “Show me everything, including inside every folder.”
---
touch, echo, cat, nano, printf

touch
	•	Creates a new empty file.
	•	Example:

touch newfile.txt

	•	If the file already exists, touch just updates its timestamp (last modified time).
⸻
echo
	•	Displays a line of text or a variable.
	•	Example:

echo "Hello World"

	•	You can also write text into a file:

echo "Hello World" > file.txt

⸻
cat
	•	Reads and shows the content of a file.
	•	Example:

cat file.txt

	•	You can also combine multiple files:

cat file1.txt file2.txt > combined.txt

⸻
nano
	•	Opens the Nano text editor inside the terminal.
	•	Example:

nano file.txt

	•	You can then edit text inside the terminal easily.

⸻
printf
	•	Like echo, but more powerful for formatting text.
	•	Example:

printf "Name: %s\nAge: %d\n" "Alice" 21

	•	It lets you format text with variables (%s for string, %d for number, etc.).

---