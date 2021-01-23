module SessionsHelper
  def flash_message
    message = ""
    flash.each do |type, msg|
      message += "<div class='alert'>#{msg}</div>"
    end
    message.html_safe
  end
end