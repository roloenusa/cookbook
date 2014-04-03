#
# Cookbook Name:: mysql_binary_log_purge
# Recipe:: default
#
#
# Cookbook Name:: mysql_binary_log_purge
# Recipe:: default

if node[:instance_role].include?('db_slave')
  
  template "/etc/engineyard/binlogpurge.yml" do
    owner 'root'
    group 'root'
    mode 0644
    source "binlogpurge.yml"
  end
  
  cron "binary_log_purge" do
    minute  '0'
    hour    '*/4'
    day     '*'
    month   '*'
    weekday '*'
    command "/usr/local/ey_resin/bin/binary_log_purge -q"
  end
end