class AddMatchTeamsRelationship < ActiveRecord::Migration
  def self.up
    create_table :matches_teams do |t|
      t.references :match, :team
    end
  end

  def self.down
    drop_table :matches_teams
  end
end