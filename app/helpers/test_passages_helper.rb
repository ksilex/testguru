module TestPassagesHelper
  def result(test_passage)
    if test_passage.success?
      "<b>#{t(".percent")}:
      <span style='color:green'>#{test_passage.percentage}%<span></b>
      <strong>#{t(".win")}</strong>".html_safe
    else
      "<b>#{t(".percent")}:
      <span style='color:red'>#{test_passage.percentage}%<span></b>
      <strong>#{t(".lose")}</strong>".html_safe
    end
  end
end
