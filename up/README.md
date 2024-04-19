# Up
Up is a command-line tool designed to simplify the process of navigating directories by providing a convenient alternative to using `cd` with relative path specifications. Instead of typing lengthy commands like `cd ../../../` to move up multiple directories, users can simply enter `up <amount>` to ascend the specified number of directories. For instance, typing `up 3` would navigate up three directories from the current location.

If the input to Up is not a number, it will default to navigating to the user's home directory. Additionally, if the specified number exceeds the available directories to ascend, Up will navigate to the topmost directory, if no amount is provided up will simply ascend 1 directory.

## Installation:
To initialize Up, add the output of `up-core init` to your shell configuration file (e.g., `.bashrc`, `.zshrc`). This step is crucial for making Up available in your shell environment. Without this configuration, Up will not be accessible for usage.
