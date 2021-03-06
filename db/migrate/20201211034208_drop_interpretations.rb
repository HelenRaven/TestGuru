class DropInterpretations < ActiveRecord::Migration[6.0]
  def change
    drop_table :interpretations do |t|
      t.string :body, null: false
      t.string :mark, limit: 1, default: '0'
      t.belongs_to :test, foreign_key: true

      t.timestamps
    end
  end
end
