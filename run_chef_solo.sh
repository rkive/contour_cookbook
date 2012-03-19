#!/bin/bash
# run_chef_solo.sh
# Author: abento+github@gmail.com
# Setup a set of cookbooks using chef-solo on a remote machine.

hostname=amigrinder
domain=amigrinder.minusnine.org

cookbook_root="."
file_root="chef-solo"
tmp_root="."

installChefSolo() {
  ssh -qt $1 "which chef-solo" >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    rpms="ruby rubygems ruby-devel ruby-ri ruby-rdoc ruby-shadow gcc gcc-c++ automake autoconf make curl dmidecode openssh-clients"
    gems="chef"

    echo "Pushing chef-solo config to host $1"
    ssh -t $1 "sudo hostname $1"
    ssh -t $1 "sudo yum -y install $rpms"
    ssh -t $1 "sudo gem install $gems --no-ri --no-rdoc"
    echo "chef-solo install complete for host $1"
  else
    echo "chef-solo already installed. Skipping installation."
    return 0 
  fi
}

pushConfig()
{
  echo "Pushing chef-solo config to host $1"

  solo_file=$file_root/solo.rb
  runlist_file=$file_root/run_list.json

  if [ -f $solo_file ]; then
    scp $solo_file $1: >/dev/null 2>&1
  else
    echo "$solo_file doesn't exist."
    exit 1
  fi

  if [ -f $runlist_file ]; then
    scp $runlist_file $1: >/dev/null 2>&1
  else
    echo "$runlist_file doesn't exist."
    exit 1
  fi

  scp $ $1: >/dev/null 2>&1

  echo "Taring up cookbooks..."
  COPYFILE_DISABLE=1 tar zcLf $tmp_root/solo_cookbooks.tgz $cookbook_root/cookbooks

  if [ $? -ne 0 ]; then
    echo "Problems creating tarball."
    exit 1
  fi

  echo "Sending up cookbook tarball..."
  scp $tmp_root/solo_cookbooks.tgz $1:  >/dev/null 2>&1
  
  if [ $? -ne 0 ]; then
    echo "Problems push tarball to $1."
    exit 1
  fi
}

runChefSolo()
{
    echo "Running chef-solo on host $1"
    ssh -t $1 "sudo chef-solo -c ./solo.rb -j ./run_list.json -r ./solo_cookbooks.tgz --log_level debug"
}

if [ "$1" ]
  then
    installChefSolo $1
    pushConfig $1
    runChefSolo $1
  else
    for host in $hostname.$domain; do
      pushConfig $host
      runChefSolo $host
    done
fi

echo "chef-solo push and config run complete"
