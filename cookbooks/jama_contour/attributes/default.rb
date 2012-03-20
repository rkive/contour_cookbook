#
# Cookbook Name:: jama_contour
# Attributes:: default
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

default[:jama_contour][:version] = "3_4_1"

default[:jama_contour][:webapp_dir] = "#{node[:tomcat6][:webapps]}/contour"
default[:jama_contour][:home] = "/opt/contour_home"

default[:jama_contour][:mysql][:db] = "contour"
default[:jama_contour][:mysql][:user] = "contouruser"
default[:jama_contour][:mysql][:pass] = "contourpass"