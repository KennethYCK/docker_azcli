FROM ubuntu:22.04 as base


 
# Copy the file from the local host to the filesystem of the container at the working directory.


WORKDIR /tmp/setup
 
# Install terraform

RUN apt-get update 
RUN apt-get install -y \
	gpg \
	wget \
	curl \
	apt-transport-https \
	software-properties-common

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bionic main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt-get update
RUN apt-get install -y terraform

#Install Powershell
RUN wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Register the Microsoft repository keys
RUN dpkg -i packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
RUN apt-get update

###################################
# Install PowerShell
RUN apt-get install -y powershell

RUN pwsh -command Install-Module -Name Az -Repository PSGallery -Force