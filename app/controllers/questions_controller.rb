class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.create(question_params)
    render html: '<b style="color: green;">Вопрос был успешно добавлен.</b>'.html_safe
  end

  def edit
  end

  def show
  end

  def destroy
    @question.destroy
    render html: '<b style="color: red;">Вопрос был успешно удален.</b>'.html_safe
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
