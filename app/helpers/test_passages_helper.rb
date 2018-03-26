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
end
