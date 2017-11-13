#
# Cookbook Name:: kkafka
# Recipe:: _configure
#

directory node['kkafka']['config_dir'] do
  owner node['kkafka']['user']
  group node['kkafka']['group']
  mode '755'
  recursive true
end

template ::File.join(node['kkafka']['config_dir'], 'log4j.properties') do
  source 'log4j.properties.erb'
  owner node['kkafka']['user']
  group node['kkafka']['group']
  mode '644'
  helpers(Kafka::Log4J)
  variables({
    config: node['kkafka']['log4j'],
  })
  if restart_on_configuration_change?
    notifies :create, 'ruby_block[coordinate-kafka-start]', :immediately
  end
end

template ::File.join(node['kkafka']['config_dir'], 'server.properties') do
  source 'server.properties.erb'
  owner node['kkafka']['user']
  group node['kkafka']['group']
  mode '644'
  helper :config do
    node['kkafka']['broker'].sort_by(&:first)
  end
  helpers(Kafka::Configuration)
  # variables({
  #   zk_ip: zk_ip
  # })
  if restart_on_configuration_change?
    notifies :create, 'ruby_block[coordinate-kafka-start]', :immediately
  end
end

template kafka_init_opts['env_path'] do
  source kafka_init_opts.fetch(:env_template, 'env.erb')
  owner 'root'
  group 'root'
  mode '644'
  variables({
    main_class: 'kafka.Kafka',
  })
  if restart_on_configuration_change?
    notifies :create, 'ruby_block[coordinate-kafka-start]', :immediately
  end
end

template kafka_init_opts['script_path'] do
  source kafka_init_opts['source']
  owner 'root'
  group 'root'
  mode kafka_init_opts['permissions']
  variables({
    daemon_name: 'kafka',
    port: node['kkafka']['broker']['port'],
    user: node['kkafka']['user'],
    env_path: kafka_init_opts['env_path'],
    ulimit: node['kkafka']['ulimit_file'],
    kill_timeout: node['kkafka']['kill_timeout'],
  })
  helper :controlled_shutdown_enabled? do
    !!fetch_broker_attribute(:controlled, :shutdown, :enable)
  end
  if restart_on_configuration_change?
    notifies :create, 'ruby_block[coordinate-kafka-start]', :immediately
  end
end


remote_file "#{node['kkafka']['install_dir']}/libs/hops-kafka-authorizer-#{node['kkafka']['authorizer_version']}.jar" do
  user 'root'
  group 'root'
  source "http://snurran.sics.se/hops/hops-kafka-authorizer-#{node['kkafka']['authorizer_version']}.jar"
  mode 0755
  action :create_if_missing
end

# Register Kafka as HopsWorks service
bash 'set_kafka_as_enabled' do
  user "root"
  group "root"
  code <<-EOH
    #{node['ndb']['scripts_dir']}/mysql-client.sh -e \"INSERT INTO hopsworks.variables values('kafka_enabled', '#{node['kkafka']['enabled']}')\"
  EOH
  not_if "#{node['ndb']['scripts_dir']}/mysql-client.sh -e \"SELECT * FROM hopsworks.variables WHERE id='kafka_enabled'\" | grep kafka_enabled"
end

include_recipe node['kkafka']['start_coordination']['recipe']
