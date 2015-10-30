class AddAtBatIdToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :at_bat_id, :integer
  end
end
