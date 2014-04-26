execute "get repo" do
  command "add-apt-repository ppa:webupd8team/java"
end

execute "agree license" do
  command "/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"
end

execute "license seen" do
  command "/bin/echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections"
end

package "oracle-java8-installer" do
  action :install
end
