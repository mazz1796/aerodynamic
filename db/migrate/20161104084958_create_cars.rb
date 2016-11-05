class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :body_type
      t.string :brand
      t.integer :accommodate
      t.string :transmission
      t.string :drive_type
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_satnav
      t.boolean :is_bluetooth
      t.boolean :is_air
      t.boolean :is_usb
      t.boolean :is_abs
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
