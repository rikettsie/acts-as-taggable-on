class ChangeTagNameType < ActiveRecord::Migration
  def up
    remove_index :tags, :name
  	change_column :tags, :name, :text
    add_index :tags, :name, unique: true
  end

  def down
    remove_index :tags, :name
  	change_column :tags, :name, :string
    add_index :tags, :name, unique: true
  end
end
