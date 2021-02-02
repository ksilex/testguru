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
    service = GistQuestionService.new(@test_passage.current_question)
    response = service.call

    message = if service.success?
      create_gist(@test_passage.user, @test_passage.current_question, gist_hash(response))
      { notice: "#{t(".link_text")}:
      #{view_context.link_to gist_hash(response), response[:html_url]}" }
    else
      { alert: t(".error") }
    end

    redirect_to @test_passage, message
  end

  private

  def create_gist(user, question, url)
    Gist.create(user: user, question: question, gist_url: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
