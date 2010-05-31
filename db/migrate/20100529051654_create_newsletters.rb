class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :name
      t.integer :year
      t.integer :month
      t.binary :data, :limit => 1.megabyte
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
