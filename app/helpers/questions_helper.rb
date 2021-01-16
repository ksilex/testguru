module QuestionsHelper
  def question_header(question)
    if question.persisted?
      action = "Изменение"
    else
      action = "Создание"
    end
    "#{action} вопроса для теста #{@test.title}"
  end
end