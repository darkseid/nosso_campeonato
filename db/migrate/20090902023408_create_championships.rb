class CreateChampionships < ActiveRecord::Migration
  def self.up
    create_table :championships do |t|
      

      t.timestamps
    end
  end

  def self.down
    drop_table :championships
  end
end
