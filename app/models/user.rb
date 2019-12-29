class User < ActiveRecord::Base

    has_secure_password
       
    validates :username, :email_address, :password, presence: true

    validates :username, :email_address, uniqueness: true
  
    validates :password, presence: true, on: :create
    
    validates :password, length: { in: 4..20 }, confirmation: true, unless: ->(u){ u.password.blank? }

    has_many :posts


end 