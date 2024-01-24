### Docker container to use IDEA formatter

use

    docker run --rm  --user $(id -u):$(id -g) --volume $(pwd):/data praml/intellij-formatter:1.0

to format code in current directory