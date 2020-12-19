class RenameRightAtAnswers < ActiveRecord::Migration[6.0]
  def up
    rename_column :answers, :right, :correct
  end

end
