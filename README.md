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
Displays version of command.

```bash
internsctl cpu getinfo
```
Displays CPU information.

```bash
internsctl memory getinfo
```
Displays memory information.

```bash
internsctl user create <username>
```
Creates a user with <username> as his username.

```bash
internsctl user list
```
Displays list of all regular users.

```bash
internsctl user list --sudo-only
```
Displays list of users with superuser access.

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
