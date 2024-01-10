# XenonLinuxTask
Custom linux command created as part of assignment for hiring process of XenonStack.
## Usage/Examples

```bash
man internsctl
```
Displays the complete manual for this command.

```bash
internsctl --help
```
Shows format and options for this command along with usage.

```bash
internsctl --version
```
# Section A
Steps:
1. Create a file internsctl.sh
2. write the mannual
3. save the code with Ctrl+O
4. Make the script executable using the following command:(man ./internsctl.sh
)
![image](https://github.com/rajatsinha28/XenonLinuxTask/assets/89475456/11ee80a2-9dc4-427e-be8a-f6e818313fd3)

5. To see help message: ./internsctl.sh --help
6. To see the version: ./internsctl.sh --version
![image](https://github.com/rajatsinha28/XenonLinuxTask/assets/89475456/24fcb433-564c-48c8-a20c-93564e529ffc)


#Section B

```bash
internsctl cpu getinfo
```
Displays CPU information.

```bash
internsctl memory getinfo
```
![image](https://github.com/rajatsinha28/XenonLinuxTask/assets/89475456/a7a4a973-0ad2-4e63-ba0c-92124eef2beb)

Displays memory information.

#Part 2

```bash
internsctl user create <username>
```
Creates a user with <username> as his username.

```bash
internsctl user list
```
Displays list of all regular users.
![image](https://github.com/rajatsinha28/XenonLinuxTask/assets/89475456/4bcb6df0-1340-458f-8260-3012b204999d)

```bash
internsctl user list --sudo-only
```
Displays list of users with superuser access.
![image](https://github.com/rajatsinha28/XenonLinuxTask/assets/89475456/7ecbabdc-81b3-4069-ac28-78383ee526cc)

```bash
internsctl file getinfo <file-name>
```
Displays file information in the following format:
```bash
File: hellot.txt
Access: -rw-r--r--
Size(B): 5448
Owner: xenonstack
Modify: 2020-10-07 20:34:44.616123431 +0530
```

```bash
internsctl file getinfo [options] <file-name>
```
Displays only the selected attribute of the file. These attributes include:

```bash
--size, -s to print size
--permissions, -p print file permissions
--owner, o print file owner
--last-modified, m
```
