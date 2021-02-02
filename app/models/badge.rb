class Badge < ApplicationRecord

  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :results, dependent: :destroy

  validates :name, :image_name, :rule, :parameter, presence: true

  IMAGES = "public/badges"

  RULES = [
    {name: :all_in_category,
     description: I18n.t('.all_in_category'),
     selector: Category.all.pluck(:title)
    },
    {name: :all_at_level,
     description: I18n.t('.all_at_level'),
     selector: Test.all.pluck(:level).uniq.sort
    },
    {name: :for_first_time,
     description: I18n.t('.for_first_time'),
     selector: Test.all.pluck(:title)
    }
  ]

  def get_rule_info(rule_name, param)
    rule_name = rule_name.to_sym unless rule_name.is_a?(Symbol)
    param = param.to_sym unless param.is_a?(Symbol)

    RULES.each do |rule|
      if rule[:name] == rule_name
        return rule[param]
      end
    end
  end

  def rules_selector
    rules = []
    RULES.each do |rule|
      rules << [rule[:description], rule[:name]]
    end
    rules
  end

  def rules
    RULES
  end

  def image_names
    Dir.children(IMAGES)
  end

end
