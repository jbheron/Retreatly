class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name

      t.string :country
      t.string :city
      t.string :address

      t.text :lodging
      t.text :travel

      t.references :user
      t.references :event
      # t.references :location

      t.timestamps null: false
    end
  end
end
