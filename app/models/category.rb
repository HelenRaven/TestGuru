class Category < ApplicationRecord
  has_many :tests, dependent: :delete_all

  validates :title, presence: true

  default_scope {order(title: :asc)}

end
