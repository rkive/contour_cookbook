#
# Cookbook Name:: jama_contour
# Recipe:: _install_tarball
#
# Copyright 2012, Aaron Bento
#
# All rights reserved - Do Not Redistribute
#

#http://www.jamasoftware.com/media/download/contour_3_4_1.tar.gz

bash "install_tarball" do
  contour_version_name = "contour_#{node[:jama_contour][:version]}"
  contour_version_name_tgz = "#{contour_version_name}.tar.gz"
  user node[:tomcat6][:user]
  cwd node[:tomcat6][:webapps]
  not_if {File.exists?(node[:jama_contour][:webapp_dir])}
  code <<-EOH
    wget http://www.jamasoftware.com/media/download/#{contour_version_name_tgz}
    tar -zxf #{contour_version_name_tgz}
    rm #{contour_version_name_tgz}
    chown -R #{node[:tomcat6][:user]}:#{node[:tomcat6][:user]} #{contour_version_name}
  EOH
end


