apt_repository "nginx" do
  uri "http://ppa.launchpad.net/nginx/development/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
end

include_recipe 'nginx'

package 'nginx-extras' do
  notifies :reload, 'service[nginx]'
end

template "#{node['nginx']['dir']}/sites-enabled/alerta" do
  source 'nginx/alerta.conf.erb'
  notifies :reload, 'service[nginx]'
  variables(
    alerta_backend: 'localhost:8080',
  )
end
