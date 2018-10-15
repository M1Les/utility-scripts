# make sure you do not select autologin for your user -- otherwise hyper-v enchanced session will not work

# enable ssh

# install ssh service
sudo apt install ssh
# check that ssh is started
service ssh status

# install docker

# update your existing list of packages
sudo apt update
# install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common
# add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# update the package database with the Docker packages from the newly added repo
sudo apt update
# make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce
# you should see an output similar to this:
# ```
# docker-ce:
#   Installed: (none)
#   Candidate: 18.03.1~ce~3-0~ubuntu
#   Version table:
#      18.03.1~ce~3-0~ubuntu 500
#         500 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages
# ```

# install Docker
sudo apt install docker-ce
# check that it's running
sudo systemctl status docker

# By default, the docker command can only be run the root user or by a user
# in the docker group, which is automatically created during Docker's installation process.
# add current user to the docker group
sudo usermod -aG docker ${USER}
# To apply the new group membership, log out of the server and back in, or type the following
su - ${USER}
# You will be prompted to enter your user's password to continue.