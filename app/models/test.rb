class Test < ApplicationRecord

  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: :user_id, optional: true
  has_many :questions, dependent: :delete_all
  has_many :results, dependent: :delete_all
  has_many :users, through: :results

  validates :title, presence: true
  validates :level, numericality: {only_integer: true, greater_than_or_equal: 0}
  validates :title, uniqueness: {scope: :level}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :with_category, -> (category) { joins(:category)
                                        .where("categories.title = ?", category)}

  scope :with_level, -> (level) { where(level: level)}

  def self.with_category_desc(category)
         with_category(category)
        .order(title: :desc)
        .pluck(:title)
  end
end
