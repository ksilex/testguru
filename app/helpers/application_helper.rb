module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(user, project)
    link_to "Код проекта", "https://github.com/#{user}/#{project}", target: "_blank"
  end

  def action_for(instance)
    if instance.persisted?
      t("edit")
    else
      t("create")
    end
  end
end
