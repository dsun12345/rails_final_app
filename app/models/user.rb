class User < ActiveRecord::Base

    has_secure_password
    validates :name, presence: true
    validates :email, email: true 
    validates :email, uniqueness: true
    validates :password, presence: true


    has_many :artworks
    has_many :museums, :through => :artworks


end 