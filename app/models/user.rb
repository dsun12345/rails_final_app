class User < ActiveRecord::Base

    has_secure_password
    validates :name, presence: true
    validates :email, email: true 
    validates :email, uniqueness: true
    validates :password, length: { in: 6..16 }


    has_many :artworks
    has_many :museums, :through => :artworks


end 