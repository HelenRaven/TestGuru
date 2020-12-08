class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :interpretations
  has_many :results
  has_many :users, through: :results

  def self.with_category(category)
    self.joins(:category)
        .where("categories.title = ?", category)
        .order(title: :desc)
        .pluck(:title)
  end
end
