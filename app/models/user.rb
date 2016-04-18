class User < ActiveRecord::Base
  has_secure_password

  has_many :gifs

  enum role: %w(default admin)
end
