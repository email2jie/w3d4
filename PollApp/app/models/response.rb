class Response < ActiveRecord::Base
  validates :answer_choice_id, :responder_id, presence: true
  validate :respondent_already_answered?

  belongs_to :answer_choice,
  class_name: :AnswerChoice,
  primary_key: :id,
  foreign_key: :answer_choice_id

  belongs_to :respondent,
  class_name: :User,
  primary_key: :id,
  foreign_key: :responder_id

  has_one :question,
    through: :answer_choice,
    source: :question


  def sibling_responses
    # if self.id.nil?
    #   self.question.responses
    # else
    #   self.question.responses.where.not('responses.id = ?', self.id)
    # end
    self.question.responses.where.not(id: self.id)
  end


  def respondent_already_answered?

    if self.sibling_responses.exists?(responder_id: self.responder_id)
      errors[:base] << "Same user can't have multiple response to one question."
    end
  end

end
