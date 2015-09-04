# pip install alerta-server

git '/opt/alerta-webui' do
  repository 'https://github.com/alerta/angular-alerta-webui.git'
  revision '257e3e1b0e8d8fafad60f5014c1a6b62e5d1975b'
  action :sync
end

template "/opt/alerta-webui/app/config.js" do
  source 'alerta_webui/config.js.erb'
  variables(
    auth: node['alerta']['auth']
  )
end