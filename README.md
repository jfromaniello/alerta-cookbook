Chef cookbook for [alerta](http://alerta.io).

It installs and configure mongodb, nginx, alerta-server and alerta-webui.

There is a very basic support for plugins.

Both API and WebUI runs on the same server and port.

## Testing

```
berks install
vagrant up
```

## Attributes


-  `['alerta']['auth']['provider']` - (defaults to `'basic'`). it can be basic, github, google, etc.
-  `['alerta']['auth']['oauth2_client_id']` - the oauth2 client_id
-  `['alerta']['auth']['oauth2_client_secret']` - the oauth2 client_secret
-  `['alerta']['auth']['allowed_github_orgs']` - an array of allowed github organizations.
-  `['alerta']['auth']['allowed_email_domains']` - an array of allowed email domains.
-  `['alerta']['auth']['required']` - (defaults to `'false'`) specify if authentication is required.
-  `['alerta']['secret_key']` - the secret_key for cookies
-  `['alerta']['plugins']` - (defaults to `false`) array of plugins to enable
-  `['alerta']['url']` - (defaults to 'http://try.alerta.io') the url of the instance





