class AddProgressToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :progress, :integer, default: 0
  end
end
