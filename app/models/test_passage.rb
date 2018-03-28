class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def total_percent
    100.to_f * self.correct_questions / test.questions.size
  end

  def total_questions
    test.questions.size
  end

  def question_number
    total_questions - left_questions.size
  end

  def success?
    total_percent >= 85
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def left_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    left_questions.first
  end

  def determine_question
    return test.questions.first if self.current_question.nil?
    next_question
  end

  def before_save_set_question
    self.current_question = determine_question
  end

end
