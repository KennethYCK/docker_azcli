base on ubuntu 22 and install terraform with Az command.

#how to build
go to folder
docker build . -t azcli:v2

#How to run
docker run -it --name azcli -v "path:/terrafrom" azcli:latest