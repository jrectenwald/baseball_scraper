class AddGamesAndInnings < ActiveRecord::Migration
  def change
    create_table :games do |t|
    end

    create_table :innings do |t|
      t.string :number
      t.string :away_team
      t.string :home_team
      t.string :next_inning
    end
  end
end
