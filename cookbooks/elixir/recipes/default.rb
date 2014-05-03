erlang_version = "17.0"
name = "esl-erlang_#{erlang_version}-1~ubuntu~precise_amd64.deb"
target_dir = "/tmp"

remote_file "#{target_dir}/#{name}" do
  source "http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_17.0-1~ubuntu~precise_amd64.deb"
  mode 0644
  checksum "9c727b7abf895a56720672b2122c81d4"
end

dpkg_package "esl-erlang" do
  source "#{target_dir}/#{name}"
  action :install
  ignore_failure true
end

#apt_package "esl-erlang" do
  #source "#{target_dir}/#{name}"
  #action :install
#end
