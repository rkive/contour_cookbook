default[:jama_contour][:version] = "3_4_1"

default[:jama_contour][:webapp_dir] = "#{node[:tomcat6][:webapps]}/contour"
default[:jama_contour][:home] = "/opt/contour_home"

default[:jama_contour][:mysql][:db] = "contour"
default[:jama_contour][:mysql][:user] = "contouruser"
default[:jama_contour][:mysql][:pass] = "contourpass"