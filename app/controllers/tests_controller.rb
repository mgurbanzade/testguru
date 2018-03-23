class TestsController < ApplicationController
  before_action :find_test, :find_question, only: [:show]

  def index
    @tests = Test.all
  end

  def new
  end

  def create
    # test = Test.create(test_params)
    #render plain: test.inspect
  end

  def edit
  end

  def show
    @test
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end
end
