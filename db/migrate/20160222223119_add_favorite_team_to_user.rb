class AddFavoriteTeamToUser < ActiveRecord::Migration
  def change
        add_column :users, :favorite, :string
  end
end
