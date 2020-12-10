class Interpretation < ApplicationRecord
  belongs_to :test

  validates :body, presence: true
end
