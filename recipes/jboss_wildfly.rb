include_recipe 'datadog::dd-agent'

# Monitor JBoss/WildFly
#
# Here is the description of acceptable attributes:
# node.datadog.jboss/wildfly = 
datadog_monitor 'jboss/wildfly' do
  instances node['datadog']['jboss/wildfly']['instances']
  logs node['datadog']['jboss/wildfly']['logs']
  action :add
  notifies :restart, 'service[datadog-agent]' if node['datadog']['agent_start']
end
