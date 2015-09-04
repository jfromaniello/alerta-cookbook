# pip install alerta-server


package 'python-pip'
package 'python-dev'
package 'build-essential'
package 'libffi-dev'

python_pip "alerta-server" do
  notifies :reload, 'service[alerta-server]'
end

user 'alerta-server' do
  system true
end

template "/etc/init/alerta-server.conf" do
  source 'alerta_server/init.conf.erb'
  notifies :reload, 'service[alerta-server]'
  variables()
end

template "/etc/alertad.conf" do
  source 'alerta_server/alertad.conf.erb'
  notifies :reload, 'service[alerta-server]'
  variables(
    auth:       node['alerta']['auth'],
    secret_key: node['alerta']['secret_key'],
    plugins:    node['alerta']['plugins'].keys
  )
end

logrotate_app 'alerta-server' do
  cookbook  'logrotate'
  path      '/var/log/alerta-server.log'
  frequency 'hourly'
  rotate    30
end

link '/etc/init.d/alerta-server' do
  to '/etc/init/alerta-server.conf'
end

service "alerta-server" do
  action :start
end