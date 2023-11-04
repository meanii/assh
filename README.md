# assh
> assh assists in automatically reconnecting an SSH connection if it happens to drop.

demo video: https://www.youtube.com/watch?v=EAjosu4AVGQ

## Installation

you can install assh by running the following command in your terminal:
> NOTE: this will append the script to your ~/.profile file

```sh
echo "# assh" >> ~/.profile
curl -o- https://raw.githubusercontent.com/meanii/assh/main/script.sh >> ~/.profile
```

## Usage

```sh
assh <ssh-connection-string>
```