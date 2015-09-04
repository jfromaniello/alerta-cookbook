name             'alerta'
maintainer       'José F. Romaniello'
maintainer_email 'jfromaniello@gmail.com'
license          'MIT'
description      'Installs/Configures alerta'
long_description 'Installs/Configures alerta'
version          '0.1.0'

%w(apt ohai newrelic build-essential nginx python logrotate).each do |cookbook|
  depends cookbook
end