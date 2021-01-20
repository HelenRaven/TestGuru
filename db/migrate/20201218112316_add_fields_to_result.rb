class AddFieldsToResult < ActiveRecord::Migration[6.0]

  def change
    change_table :results do |t|
      t.rename :progress, :correct_questions
      t.remove :result
      t.belongs_to :question, foreign_key: true
    end
  end

end
