# Unity SSH Deployer

Deploys a Unity build to an external (Windows) machine using SSH.

Copies the given Build folder to an external (Windows) machine and the previous active build to Build-[date]-[time]

## Install

- Install [OpenSSH](https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH) on remote machine
- Install [Git](https://git-scm.com/) on local & remote machine (for unix tools)
- Create `~/.ssh/authorized_keys` and put local public key in the file
- [Set permissions](https://github.com/PowerShell/Win32-OpenSSH/wiki/Security-protection-of-various-files-in-win32-openssh#authorized_keys) of `authorized_keys`: 

## Usage

- Copy `deploy.sh` next to the Unity Build folder
- Run `./deploy.sh -u <username> -h <host>`
