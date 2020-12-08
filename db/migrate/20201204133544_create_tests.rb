class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.boolean :abc, default: false
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
