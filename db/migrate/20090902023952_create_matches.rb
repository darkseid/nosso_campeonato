class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :home_score, :default => 0
      t.integer :visitor_score, :default => 0
      t.references :phase
      t.references :home
      t.references :visitor
      t.boolean :done
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
