#
# Cookbook Name:: myapache
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
update_command = 'apt-get update'

execute "update packages" do
	command update_command
end

package "apache2" do
	action :install
end

service "apache2" do
	action [ :enable, :start ]
end

template "/var/www/html/index.html" do
	source "index.erb"
	owner "root"
	group "root"
	mode "0644"
end



	