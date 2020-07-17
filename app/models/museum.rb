class Museum < ActiveRecord::Base

    validates :name, presence: true
    validates :location, presence: true
    has_many :artworks
    has_many :users, :through => :artworks

end 