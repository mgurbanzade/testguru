module TestPassagesHelper
  def question_title
    "#{@test_passage.question_number}. #{@test_passage.current_question.body}"
  end

  def result_color_class
    @test_passage.success? ? "success" : "failure"
  end

  def test_passage_status
    @test_passage.success? ? t('.test_passed') : t('.test_failed')
  end

  def progress_bar
    questions_count = @test_passage.test.questions.size
    current_question = @test_passage.question_number
    question_value = 100 / questions_count
    current_question * question_value - question_value
  end
end
