class AddPassEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :string, default: ""
    add_column :users, :email, :string, default: "user@email.com"
  end
end
