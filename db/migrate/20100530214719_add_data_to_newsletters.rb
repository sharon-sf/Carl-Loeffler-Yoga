class AddDataToNewsletters < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :data, :binary
  end

  def self.down
    remove_column :newsletters, :data
  end
end
