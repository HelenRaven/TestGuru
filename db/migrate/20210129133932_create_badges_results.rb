class CreateBadgesResults < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_results, id: false do |t|
      t.belongs_to :badge
      t.belongs_to :result
    end
  end
end
