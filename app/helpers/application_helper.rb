module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(user, project)
    "https://github.com/#{user}/#{project}"
  end
end
