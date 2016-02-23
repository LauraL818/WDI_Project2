class AddStadiumToEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :stadium, index: true, foreign_key: true
  end
end
