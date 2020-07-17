class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :artist
      t.belongs_to :museum
      t.belongs_to :user
      t.timestamps
    end
  end
end
 