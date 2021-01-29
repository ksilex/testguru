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
    { success: "alert alert-success alert-dismissible fade show",
      error: "alert alert-danger alert-dismissible fade show",
      alert: "alert alert-warning alert-dismissible fade show", 
      notice: "alert alert-info alert-dismissible fade show" }.stringify_keys[level.to_s]
  end

  def gist_hash(result)
    result[:location][/[^\/]*$/]
  end

  def gist_link(result)
    "https://gist.github.com/ksilex/#{gist_hash(result)}"
  end
end
