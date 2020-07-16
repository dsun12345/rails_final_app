class Artwork < ActiveRecord::Base

    belongs_to :museum
    belongs_to :user

end 