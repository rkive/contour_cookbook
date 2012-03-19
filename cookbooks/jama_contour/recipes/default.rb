#
# Cookbook Name:: jama_contour
# Recipe:: default
#
# Copyright 2012, Aaron Bento
#
# All rights reserved - Do Not Redistribute
#


include_recipe "jama_contour::_install_tarball"
include_recipe "jama_contour::_contour_home"
include_recipe "jama_contour::_mysql_database"


