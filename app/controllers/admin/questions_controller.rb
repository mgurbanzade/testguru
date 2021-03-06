class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      notice_message('success', 'question', 'created')
      redirect_to [:admin, @question.test]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      notice_message('success', 'question', 'updated')
      redirect_to [:admin, @question.test]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    notice_message('success', 'question', 'deleted')
    redirect_to [:admin, @question.test]
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
