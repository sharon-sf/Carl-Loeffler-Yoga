class RemoveDate < ActiveRecord::Migration
  def self.up
    remove_column :qas, :date
  end


  def self.down
    add_column :qas, :date, :datetime
  end
end
