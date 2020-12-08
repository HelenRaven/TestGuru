class CreateResults < ActiveRecord::Migration[6.0]
	def change
		create_table :results, id: false do |t|
			t.belongs_to :user
			t.belongs_to :test
			t.string :result, default: '0'
			t.timestamps
		end
	end
end
