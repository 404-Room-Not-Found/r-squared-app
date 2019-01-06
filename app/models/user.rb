class User < ActiveRecord::Base
    has_secure_password
    validates :name, uniqueness: true
    validates :email, uniqueness: true
end
