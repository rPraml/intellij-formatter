# Build

Locally build with


    docker build -t praml/intellij-formatter:1.1 .
    docker build -t praml/intellij-formatter:latest .

test the containers before pushing!

push
    docker login -u praml
    docker push praml/intellij-formatter:1.1
    docker push praml/intellij-formatter:latest
