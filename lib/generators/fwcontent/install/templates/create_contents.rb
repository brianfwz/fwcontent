class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string   "title"
      t.text     "description"
      t.string   "position"  
      t.string   "page"  
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end