Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1893916007558817', '5d9022504e8c28528d32791b2fc0d034'
  	scope: 'email,picture,user_hometown,first_name,last_name,', display: 'popup'
end
