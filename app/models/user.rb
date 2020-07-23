class User < ActiveRecord::Base

    has_secure_password
    validates :name, presence: true
    validates :email, email: true 
    validates :email, uniqueness: true
    validates :password, presence: true


    has_many :artworks
    has_many :museums, :through => :artworks
    # Clean up 
    def self.oauth_create(auth)
        oauth_email = auth["email"]
        oauth_name = auth["name"]
        find_or_create_by(:email => oauth_email) do |user|
            user.name = oauth_name
            user.password = SecureRandom.hex
        end 
    end 

end 