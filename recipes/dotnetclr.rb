include_recipe 'datadog::dd-agent'

# Monitor .NET CLR
#
# Here is the description of acceptable attributes:
# node.datadog..net_clr = 
datadog_monitor '.net_clr' do
  instances node['datadog']['.net_clr']['instances']
  logs node['datadog']['.net_clr']['logs']
  action :add
  notifies :restart, 'service[datadog-agent]' if node['datadog']['agent_start']
end
