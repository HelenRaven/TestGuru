class CreateInterpretations < ActiveRecord::Migration[6.0]
  def change
    create_table :interpretations do |t|
      t.string :body, null: false
      t.integer :mark, default: 0
      t.belongs_to :test, foreign_key: true

      t.timestamps
    end
  end
end
