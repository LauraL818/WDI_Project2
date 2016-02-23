class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name
      t.string :team
      t.string :location
      t.string :photo
      t.integer :year
      t.integer :capacity
      t.string :history
      t.string :feature

      t.timestamps null: false
    end
  end
end
