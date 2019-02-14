class Question < ApplicationRecord
  validates :text, presence: true
  validates :poll_id, presence: true

  belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id,
    optional: true

  has_many :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answers = self.answer_choices
      .select('answer_choices.text, COUNT(responses.id) AS num_responses')
      .left_outer_joins(:responses)
      .group('answer_choices.id')
      
    answers.inject({}) do |results, ans|
      results[ans.text] = ans.num_responses
      results
    end
  end

  def results_n_plus_one
    answers = self.answer_choices
    results_hsh = {}

    answers.each do |answer|
      results_hsh[answer.text] = answer.responses.length
    end

    results_hsh
  end

  def results_v1
    answers = self.answer_choices.includes(:responses)
    results_hsh = {}
    answers.each do |answer|
      results_hsh[answer.text] = answer.responses.length
    end

    results_hsh
  end

end
