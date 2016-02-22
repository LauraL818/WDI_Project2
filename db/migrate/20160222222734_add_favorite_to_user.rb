class AddFavoriteToUser < ActiveRecord::Migration
  def change
      add_column :users, :favorite, :string
  end
end
