# assh
> assh assists in automatically reconnecting an SSH connection if it happens to drop.

demo video: https://www.youtube.com/watch?v=EAjosu4AVGQ

## Installation

### Prerequisites
- [ssh](https://www.openssh.com/)
- [autossh](https://github.com/Autossh/autossh)
- [screen](https://www.gnu.org/software/screen/manual/screen.html)
- [curl](https://curl.se/)


you can install assh by running the following command in your terminal:
> Note: this will require sudo privileges, as it will install the script to /usr/local/bin/assh

```sh
curl -o- https://raw.githubusercontent.com/meanii/assh/main/install.sh | auto bash 
```

## Usage

```sh
assh <ssh-connection-string>
```