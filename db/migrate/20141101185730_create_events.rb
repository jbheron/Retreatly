class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.text :title
      t.date :start_date
      t.date :end_date
      t.integer :price

      t.references :user
      # t.references :location

      t.timestamps null: false
    end
  end
end
