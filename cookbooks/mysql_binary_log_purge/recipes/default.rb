#
# Cookbook Name:: mysql_binary_log_purge
# Recipe:: default
#
#
# Cookbook Name:: mysql_binary_log_purge
# Recipe:: default

if @node[:instance_role][/^db/]
  remote_file "/engineyard/bin/binary_log_purge" do
    source "binary_log_purge"
    mode "744"
  end

  remote_file "/etc/engineyard/binlogpurge.yml" do
    source "binlogpurge.yml"
    mode "644"
  end

  cron "binary_log_purge" do
    minute  '0'
    hour    '*/4'
    day     '*'
    month   '*'
    weekday '*'
    command '/engineyard/bin/binary_log_purge -q'
  end
end