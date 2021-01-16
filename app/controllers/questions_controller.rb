class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :associated_test, only: %i[create new edit update]
  before_action :find_question, only: %i[destroy edit update]

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render plain: "Question deleted"
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

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
