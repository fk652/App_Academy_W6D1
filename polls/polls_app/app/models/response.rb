# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  answer_choice_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question
end
