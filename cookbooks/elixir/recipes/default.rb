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

elixir_file = "elixir-0.13.1.zip"
elixir_zip_location = "#{target_dir}/#{elixir_file}" 
remote_file elixir_zip_location do
  source "https://github.com/elixir-lang/elixir/releases/download/v0.13.1/Precompiled.zip"
  mode 0644
end

applications_directory = "/home/mathematician314/data/applications"
elixir_directory = "#{applications_directory}/elixir" 

directory elixir_directory do
  action :create
  recursive true
  user "mathematician314"
end

execute "get repo" do
  command "unzip #{elixir_zip_location} -d #{elixir_directory}"
end unless File.directory?(elixir_directory)


%w{elixir mix iex}.each do |file|
  link "/usr/local/bin/#{file}" do
    to "#{elixir_directory}/bin/#{file}"
  end
end

rebar_directory = "#{applications_directory}/rebar"

directory rebar_directory do
  action :create
  recursive true
  user "mathematician314"
end

remote_file "#{rebar_directory}/rebar" do
  source "https://github.com/rebar/rebar/wiki/rebar"
  mode 0755
end

link "/usr/local/bin/rebar" do
  to "#{rebar_directory}/rebar"
end
