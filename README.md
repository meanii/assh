# assh
> assh assists in automatically reconnecting an SSH connection if it happens to drop.

demo video: https://www.youtube.com/watch?v=EAjosu4AVGQ

## Installation

### Prerequisites

On your local machine:
- [ssh](https://www.openssh.com/)
- [autossh](https://github.com/Autossh/autossh)
- [curl](https://curl.se/) (for the installer)

On the remote server:
- [screen](https://www.gnu.org/software/screen/manual/screen.html)
- bash

You can install assh by running the following command in your terminal:
> Note: this requires sudo privileges, as it installs the script to /usr/local/bin/assh

```sh
curl -fsSL https://raw.githubusercontent.com/meanii/assh/main/install.sh | sudo bash
```

## Usage

```sh
assh <ssh-connection-string>
```

Any arguments you would normally pass to `ssh` work, for example:

```sh
assh root@meanii.dev
assh -p 2222 user@example.com
```

When the connection drops, assh reconnects and re-attaches you to the same
`screen` session on the server, so your running programs keep going.
