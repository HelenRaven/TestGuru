class AddPassedToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :passed, :boolean, default: false
  end
end
