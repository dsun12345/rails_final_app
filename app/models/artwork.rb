class Artwork < ActiveRecord::Base
    
    validates :title, presence: true
    validates :artist, presence: true

    belongs_to :museum
    belongs_to :user

end 