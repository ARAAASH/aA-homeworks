class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :not_author_respondent

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    optional: true

  belongs_to :respondent,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id,
    optional: true

  has_one :question,
    through: :answer_choice,
    source: :question

  def not_author_respondent
    if same_author_and_respondent?
      error[:base] << "Author of a poll cannot be a respondent"
    end
  end

  def same_author_and_respondent?
    self.user_id == self.question.poll.author.id
  end

  def not_duplicate_response
    if respondent_already_answered?
      error[:base] << "No duplicate response is allowed!"
    end
  end

  def respondent_already_answered?
    sibling_responses.exists?('user_id: ?', self.respondent.id)
  end

  def sibling_responses
    self.question.responses
      .where.not('responses.id: ?', self.id)
  end


end
