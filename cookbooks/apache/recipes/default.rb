#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'apache2' do
	package_name 'httpd'
	action :install
end

service 'apache2' do
	service_name 'httpd'
	action [:start, :enable]
end

execute "example" do
  command "curl -iksS -H \"Content-Type: application/json\" -X POST -d '{\"host\":\"server1.server.com\"}' \"http://nagios/disable\" | grep success"
  retries 4
  retry_delay 3
  ignore_failure false
end

