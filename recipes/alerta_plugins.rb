node['alerta']['plugins'].keys.each do | plugin |
  directory "#{Chef::Config['file_cache_path']}/#{plugin}"

  template "#{Chef::Config['file_cache_path']}/#{plugin}/setup.py" do
    source "alerta_plugins/setup.py.erb"
    notifies :run, "execute[install plugin #{plugin}]"
    variables(
      name: plugin
    )
  end

  template "#{Chef::Config['file_cache_path']}/#{plugin}/#{plugin}.py" do
    source "alerta_plugins/#{plugin}.py.erb"
    notifies :run, "execute[install plugin #{plugin}]"
    variables({
      url: node['alerta']['url']
    }.merge(node['alerta']['plugins'][plugin]))
  end

  execute "install plugin #{plugin}" do
    command 'python setup.py install'
    cwd "#{Chef::Config['file_cache_path']}/#{plugin}"
    notifies :reload, 'service[alerta-server]'
  end
end