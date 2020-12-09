class ChangeMarkTypeInAnswers < ActiveRecord::Migration[6.0]
  def up
    change_column :answers, :mark, :integer
    change_column :interpretations, :mark, :integer
  end
  def down
    change_column :answers, :mark, :string
    change_column :interpretation, :mark, :string
  end
end
