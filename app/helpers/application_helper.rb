module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(user, project)
    link_to t(".project_code"), "https://github.com/#{user}/#{project}", target: "_blank"
  end

  def action_for(instance)
    if instance.persisted?
      t("edition")
    else
      t("create")
    end
  end

  def flash_class(level)
    case level
    when "notice" then "alert alert-info alert-dismissible fade show"
    when "success" then "alert alert-success alert-dismissible fade show"
    when "error" then "alert alert-danger alert-dismissible fade show"
    when "alert" then "alert alert-warning alert-dismissible fade show"
    end
  end
end
