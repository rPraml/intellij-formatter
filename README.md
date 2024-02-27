### Docker container to use IDEA formatter


## IntelliJ Community edition
use

    docker run --rm  --user $(id -u):$(id -g) --volume $(pwd):/data praml/intellij-formatter:1.0

to format code in current directory


## IntelliJ Ulltimate

use

    docker run --rm  --volume ~/.config/JetBrains/IntelliJIdea2023.3/:/tmp/config --volume $(pwd):/data -e UID=$(id -u) -e UNAME="$(id -un)" -it intellij-ultimate-formatter

to run with ultimate formatter. You need a valid license in your config directory.

See https://intellij-support.jetbrains.com/hc/en-us/articles/207241005-Using-IDE-on-different-machines-and-operating-systems-with-the-same-license
for details