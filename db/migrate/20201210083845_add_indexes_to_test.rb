class AddIndexesToTest < ActiveRecord::Migration[6.0]
  def up
    add_index :tests, [:level, :title], unique: true
  end

  def down
    remove_index :tests, [:level, :title]
  end
end
