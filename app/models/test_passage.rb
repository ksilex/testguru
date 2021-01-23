class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", foreign_key: "question_id", optional: true
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  SUCCESS_PERCENT = 85

  def accept!(answer_ids)
    if answers_correct?(answer_ids)
      self.correct_answers += 1
    end
    self.question_number += 1
    save!
  end

  def completed?
    current_question.nil?
  end

  def total_questions
    test.questions.size
  end

  def percentage
    (correct_answers.to_f / total_questions) * 100
  end

  def success?
    percentage > SUCCESS_PERCENT
  end

  private

  def answers_correct?(answer_ids)
    current_question.answers.correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = test.questions.where("id > ?", current_question).first
  end
end
