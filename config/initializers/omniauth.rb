Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1893916007558817'], ENV['5d9022504e8c28528d32791b2fc0d034']
end