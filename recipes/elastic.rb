include_recipe 'datadog::dd-agent'

# Monitor Elasticsearch
#
# Here is the description of acceptable attributes:
# node.datadog.elasticsearch = 
datadog_monitor 'elasticsearch' do
  instances node['datadog']['elasticsearch']['instances']
  logs node['datadog']['elasticsearch']['logs']
  action :add
  notifies :restart, 'service[datadog-agent]' if node['datadog']['agent_start']
end
