override['nginx']['version'] = '1.9.3'

override['nginx']['default_site_enabled'] = false
override['nginx']['upstream_repository'] = 'http://ppa.launchpad.net/nginx/stable/ubuntu'
override['nginx']['worker_processes'] = 4
override['nginx']['gzip'] = 'off'
override['nginx']['server_tokens'] = 'off'

override['nginx']['install_method'] = 'package'
override['nginx']['repo_source'] = 'ppa'

# Reload nginx::source attributes with our updated version
node.from_file(run_context.resolve_attribute('nginx', 'source'))