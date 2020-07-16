class User < ActiveRecord::Base

    has_many :artworks
    has_many :museums, :through => :artworks
end 