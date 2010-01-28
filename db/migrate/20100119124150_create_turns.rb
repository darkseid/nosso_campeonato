class CreateTurns < ActiveRecord::Migration
  def self.up
    create_table :turns do |t|
      t.string :name
      t.references :phases
      t.references :championship

      t.timestamps
    end
  end

  def self.down
    drop_table :turns
  end
end
