class CreateQas < ActiveRecord::Migration
  def self.up
    create_table :qas do |t|
      t.string :name
      t.text :question
      t.text :answer
      t.timestamp :date

      t.timestamps
    end
  end

  def self.down
    drop_table :qas
  end
end
