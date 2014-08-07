chef-cookbooks
==============
Install curl, chef

sudo apt-get install curl git

curl -L https://www.opscode.com/chef/install.sh | sudo bash

mkdir data

cd data

git clone git@github.com:fstaffa/chef-cookbooks.git chef
