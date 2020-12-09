class Server < ApplicationRecord
  has_secure_password :access_token
end
