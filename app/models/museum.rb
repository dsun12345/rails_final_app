class Museum < ActiveRecord::Base

    has_many :artworks
    has_many :users, :through => :artworks

end 