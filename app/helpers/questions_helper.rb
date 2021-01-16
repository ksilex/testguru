module QuestionsHelper
  def question_header
    if params[:id]
      action = "Изменение"
    else
      action = "Создание"
    end
    "#{action} вопроса для теста #{@test.title}"
  end
end