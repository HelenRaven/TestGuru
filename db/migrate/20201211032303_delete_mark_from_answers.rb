class DeleteMarkFromAnswers < ActiveRecord::Migration[6.0]
  def up
    change_table :answers do |t|
      t.remove :mark
    end
  end

  def down
    add_column :answers, :mark, :integer, default: 0
  end
end
