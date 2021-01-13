class Gist < ApplicationRecord

  belongs_to :user
  belongs_to :question

  def user_email
    user.email
  end

  def limited_question(limit)
    if question.body.length <= limit
      question.body
    else
      question.body[0,question.body.rindex(/\s/,limit-3)].rstrip + '...'
    end
  end

end
