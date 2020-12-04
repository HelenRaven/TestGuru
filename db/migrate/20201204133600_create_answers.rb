class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
    	t.string :body, null: false
    	t.string :mark, limit: 1, default: '0'
    	t.references :question, foreign_key: true

    	t.timestamps
    end
  end
end
