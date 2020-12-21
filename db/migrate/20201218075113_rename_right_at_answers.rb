class RenameRightAtAnswers < ActiveRecord::Migration[6.0]

  def change
    rename_column :answers, :right, :correct
  end

end
