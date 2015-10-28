class AddGameIdsToInnings < ActiveRecord::Migration
  def change
    add_column :innings, :game_id, :integer
  end
end
