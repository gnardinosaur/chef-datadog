include_recipe 'datadog::dd-agent'

# Monitor Kubernetes API server metrics
#
# Here is the description of acceptable attributes:
# node.datadog.kubernetes_api_server_metrics = 
datadog_monitor 'kubernetes_api_server_metrics' do
  instances node['datadog']['kubernetes_api_server_metrics']['instances']
  logs node['datadog']['kubernetes_api_server_metrics']['logs']
  action :add
  notifies :restart, 'service[datadog-agent]' if node['datadog']['agent_start']
end
