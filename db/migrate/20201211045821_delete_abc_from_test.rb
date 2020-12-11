class DeleteAbcFromTest < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :abc
  end
end
