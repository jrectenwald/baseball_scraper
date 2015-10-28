class CreateAtBatsTable < ActiveRecord::Migration
  def change
    create_table :at_bats do |t|
      t.integer :at_bat_num
      t.integer :balls
      t.integer :strikes
      t.integer :outs
      t.string :start_tfs_zulu
      t.string :stand
      t.string :b_height
      t.string :p_throws
      t.integer :batter_id
      t.integer :pitcher_id
      t.string :description
      t.string :top_or_bottom
      t.integer :home_team_runs
      t.integer :away_team_runs
    end
  end
end