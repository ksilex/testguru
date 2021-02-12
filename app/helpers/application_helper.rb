module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(user, project)
    link_to t(".project_code"), "https://github.com/#{user}/#{project}", target: :blank,
    class:"footer-link"
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

  def gist_hash(response)
    response[:html_url][/[^\/]*$/]
  end

  def gist_link(hash)
    "https://gist.github.com/ksilex/#{hash}"
  end
end
