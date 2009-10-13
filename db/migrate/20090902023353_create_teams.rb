class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :points, :default => 0
#      t.references :match
      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
