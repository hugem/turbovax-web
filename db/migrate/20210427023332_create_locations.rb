class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :uuid
      t.string :name
      t.string :address
      t.string :area
      t.boolean :enabled
      t.string :portal_key
      t.string :portal_uuid
      t.float :latitude
      t.float :longitude
      t.date :last_available

      t.timestamps
    end
  end
end
