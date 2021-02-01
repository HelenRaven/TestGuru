class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image_name
      t.string :rule
      t.string :parameter

      t.timestamps
    end
  end
end
