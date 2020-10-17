# Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="abdalluh.mostafa@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker installation for golang."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update -yq


# Install Golang
RUN apt-get install golang -yq

# Disable Prompt During Packages Installation
RUN apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git

# Copy start.sh script and define default command for the container
COPY start.sh /usr/local/bin/start.sh

#Change working dir
WORKDIR /home

# Run source command 
CMD source .env

# Start script using Entrypoint
ENTRYPOINT ["sh", "/usr/local/bin/start.sh"]
