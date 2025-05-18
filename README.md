### Bash Admin Toolkit – Advanced Linux User & Group Management Script

This is a **comprehensive interactive Bash script** designed to assist Linux system administrators in managing users, groups, files, permissions, and system status through a simple command-line menu interface.
It combines essential admin tasks into one centralized, user-friendly tool.


### Features:

#### User Management

* Add user
* Delete user
* Lock / Unlock user accounts
* Set user password
* Make user non-loginable (`nologin`)
* Show user details

#### Group Management

* Create group
* Delete group
* List groups
* Add user to group
* Remove user from group

#### File & Directory Management

* Create / Delete files and directories
* Change file permissions
* Search for files and directories across the system

#### System Monitoring

* View running processes (task manager)
* Check disk space
* Kill a process by name


#### Technical Highlights:

* Built with **pure Bash scripting**
* Uses core Linux tools like `useradd`, `usermod`, `passwd`, `groupadd`, `find`, `kill`, `chmod`, `grep`, etc.
* Includes **input validation**, `id` and `grep` checks, and `select`-based CLI menu
* Implements **PID management** and permission control
* Uses **modular functions** for easy maintenance and extension


#### How to Run:

```bash
chmod +x admin_toolkit.sh
```

```bash
./admin_tool_list.sh
```
