#
# Cookbook Name:: jama_contour
# Recipe:: _contour_home
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

directory node[:jama_contour][:home] do
  owner node[:tomcat6][:user]
  group node[:tomcat6][:group]
end