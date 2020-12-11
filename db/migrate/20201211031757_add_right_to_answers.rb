class AddRightToAnswers < ActiveRecord::Migration[6.0]
  def change
    change_table :answers do |t|
      t.boolean :right, default: false
    end
  end
end
