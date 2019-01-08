OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '678049880347-al0t1esenrlube9hjio8s12a90tsvl36.apps.googleusercontent.com', 'Sz7ZDllbvRlYVpXQk5kyCWZ1', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end