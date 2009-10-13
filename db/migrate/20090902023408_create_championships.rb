class CreateChampionships < ActiveRecord::Migration
  def self.up
    create_table :championships do |t|
      t.string :name
      t.integer :num_teams

      t.timestamps
    end
  end

  def self.down
    drop_table :championships
  end
end
