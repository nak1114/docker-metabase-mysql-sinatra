class CreateFirst < ActiveRecord::Migration[5.2]
  def change
    create_table :rsdjp_logs do |t|
      t.datetime :date, :null => false
      t.text    :name, :null => false
      
#      t.index :url, unique: true
      
    end
    create_table :updates do |t|
      t.string  :name, :null => false
      t.string  :time, :null => false
      
      t.index :name, unique: true
    end
  end
end
