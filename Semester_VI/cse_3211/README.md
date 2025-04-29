## 💻 **CSE-3211: Operating Systems Lab**

### 👨‍🏫 **Course Teacher**  
**Md. Mafiul Hasan Matin**  
*Lecturer*, Dept. of CSE, Netrokona University

---

### 🧑‍💻 **Linux Commands Overview**

#### 🔹 **Path Types**  
- **Absolute Path**: Full path from the root of the file system to the file or folder.
  - Example: `/home/user/Documents/report.txt` (Linux/Mac) or `C:\Users\John\Documents\report.txt` (Windows)
  
- **Relative Path**: Path relative to your current working directory.
  - Example: `Documents/report.txt` (if you are already inside `/home/user/`)

#### 🔹 **Basic Directory and File Operations**  
- **mkdir**: Create a new directory.
  - Example: `mkdir cse3211` creates a folder named "cse3211".
  
- **cd**: Change the directory.
  - Example: `cd /home/user/Documents` or `cd ~` (home directory).

- **pwd**: Print the current working directory.
  - Example: `/home/user/Documents`

- **ls**: List files and directories.
  - `ls -l`: Long listing with detailed file information.
  
  Example Output:
  ```
  -rw-r--r-- 1 user group 4096 Apr 27 10:00 myfile.txt
  ```
  Explanation:
  - `-rw-r--r--`: File permissions
  - `1`: Number of links
  - `user`: File owner
  - `group`: Group name
  - `4096`: File size in bytes
  - `Apr 27 10:00`: Last modified date and time
  - `myfile.txt`: File name
  
  **File permissions breakdown**:  
  `drwxrwxr-x` means:  
  - `d`: Directory  
  - `rwx`: Owner has read, write, and execute permissions  
  - `rwx`: Group has read, write, and execute permissions  
  - `r-x`: Others have read and execute permissions (no write permissions)

#### 🔹 **File and Directory Navigation**  
- **cd**: Change directories.
  - Example: `cd /home/user/Documents` moves to the "Documents" directory.
  - Example: `cd ..` moves one level up in the directory hierarchy.
  - Example: `cd ~` moves to the home directory.
  
- **ls -a**: Lists all files, including hidden ones (files starting with a dot `.`).
  - Example: `.bashrc`, `.git` are shown as hidden files.

- **ls -al**: Combines `-a` and `-l` options to show all files with detailed information.
  
- **ls -R**: Lists all files and directories recursively, including subdirectories.
  - Example Output:
    ```
    .:
    folder1  folder2  file1.txt
    
    ./folder1:
    file2.txt
    
    ./folder2:
    file3.txt
    ```

#### 🔹 **File Manipulation Commands**  
- **touch**: Creates an empty file (or updates the timestamp of an existing file).
  - Example: `touch newfile.txt`

- **echo**: Displays a line of text or writes to a file.
  - Example: `echo "Hello World"`
  - Write to a file: `echo "Hello World" > file.txt`

- **cat**: Reads and displays the contents of a file.
  - Example: `cat file.txt`

- **nano**: Opens the Nano text editor inside the terminal.
  - Example: `nano file.txt`

- **printf**: Displays formatted text.
  - Example: `printf "Name: %s\nAge: %d\n" "Alice" 21`

---

### 🧑‍💻 **Lab Practice Suggestions**  
1. **Create Directories and Files**: Practice using `mkdir`, `cd`, and `touch` to create directories and files in various locations.
2. **File Navigation**: Navigate through directories with `cd`, and list contents using `ls` with different options (`-a`, `-l`, `-R`).
3. **File Manipulation**: Use `echo`, `cat`, `nano`, and `printf` to display, edit, and format text within files.

---
