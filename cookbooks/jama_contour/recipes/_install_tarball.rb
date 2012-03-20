#
# Cookbook Name:: jama_contour
# Recipe:: _install_tarball
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


