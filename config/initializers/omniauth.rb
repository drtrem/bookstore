Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1893916007558817'], ENV['b80f533226e17854e2c14164f9c05576']
end