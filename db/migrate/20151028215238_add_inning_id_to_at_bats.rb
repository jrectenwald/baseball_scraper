class AddInningIdToAtBats < ActiveRecord::Migration
  def change
    add_column :at_bats, :inning_id, :integer
  end
end
