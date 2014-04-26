apt_repository "emacs" do
  uri "http://ppa.launchpad.net/ubuntu-elisp/ppa/ubuntu"
  distribution "trusty"
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "D62FCE72"
end

%w{vim git build-essential emacs-snapshot}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/mathematician314/.vim" do
  repository "https://github.com/fstaffa/dotvim.git"
  revision "master"
  action :sync
  user "mathematician314"
end

git "/home/mathematician314/.emacs.d" do
  repository "https://github.com/fstaffa/dotemacs.git"
  revision "master"
  action :sync
  user "mathematician314"
end

directory "/home/mathematician314/.vim/bundle" do
  action :create
  user "mathematician314"
end

git "/home/mathematician314/.vim/bundle/vundle" do
  repository "https://github.com/gmarik/vundle.git"
  revision "master"
  action :sync
  user "mathematician314"
end

execute "git user email" do
  command 'git config --global user.email "filip.staffa@gmail.com"'
end

execute "git user name" do
  command 'git config --global user.name "Filip Staffa"'
end
