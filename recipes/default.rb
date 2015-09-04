package 'git'

include_recipe 'alerta::nginx'
include_recipe 'alerta::mongodb'
include_recipe 'alerta::alerta_server'
include_recipe 'alerta::alerta_plugins'
include_recipe 'alerta::alerta_webui'