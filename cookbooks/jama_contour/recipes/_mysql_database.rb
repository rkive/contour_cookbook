
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