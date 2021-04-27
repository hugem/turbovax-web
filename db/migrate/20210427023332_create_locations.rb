class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :uuid, required: true
      t.string :name, required: true
      t.string :full_address
      t.string :area
      t.boolean :enabled, default: true
      t.string :portal_key, required: true
      t.string :portal_id
      t.float :latitude
      t.float :longitude
      t.string :time_zone
      t.string :vaccine_types
      t.json :appointments
      t.datetime :last_available

      t.timestamps
    end
  end
end
