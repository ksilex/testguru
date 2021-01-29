class TestPassagesController < ApplicationController
  include ApplicationHelper
  before_action :set_test_passage, only: %i[show result update gist]
  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
    render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    message = if result.success?
      { notice: t(".link", link_html: gist_link(result)) }
    else
      { alert: t(".error") }
    end
    redirect_to @test_passage, message
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
