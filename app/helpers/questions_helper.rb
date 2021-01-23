module QuestionsHelper
  def show_link(question)
    question.answers.size != 4
  end
end
