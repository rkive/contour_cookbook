#
# Cookbook Name:: jama_contour
# Recipe:: _mysql_database
#
# Copyright 2012, Aaron Bento
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "database"

# create connection info as an external ruby hash
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

# create a mysql database
mysql_database node[:jama_contour][:mysql][:db] do
  connection mysql_connection_info
  action :create
end

# create a mysql user but grant no priveleges
mysql_database_user node[:jama_contour][:mysql][:user] do
  connection mysql_connection_info
  password node[:jama_contour][:mysql][:pass]
  action :create
end

# grant all privileges to all tables in foo db
mysql_database_user node[:jama_contour][:mysql][:user] do
  connection mysql_connection_info
  password node[:jama_contour][:mysql][:pass]
  database_name node[:jama_contour][:mysql][:db]
  action :grant
end