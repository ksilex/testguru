module TestPassagesHelper
  def result(test_passage)
    if test_passage.percentage > 85
      "<b>Процент отвеченных вопросов:
      <span style='color:green'>#{test_passage.percentage}%<span></b>
      <strong>Тест пройден</strong>".html_safe
    else
      "<b>Процент отвеченных вопросов:
      <span style='color:red'>#{test_passage.percentage}%<span></b>
      <strong>Тест провален</strong>".html_safe
    end
  end
end
