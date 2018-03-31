class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      notice_message('success', 'answer', 'created')
      redirect_to [:admin, @answer.question]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      notice_message('success', 'answer', 'updated')
      redirect_to [:admin, @answer.question]
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    notice_message('success', 'answer', 'deleted')
    redirect_to [:admin, @answer.question]
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end
end
