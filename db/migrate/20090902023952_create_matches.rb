class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :home_team_id
      t.integer :foreign_team_id
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end