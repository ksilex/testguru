class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :associated_test, only: %i[index create new]

  def index
    render json: @test.questions
  end

  def show
    render json: Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @test.questions.create(question_params)
  end

  def destroy
    Question.find(params[:id]).delete
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def associated_test
    @test = Test.find(params[:test_id])
  end

  def not_found
    render plain: "Test not found"
  end
end
