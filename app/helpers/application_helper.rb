module ApplicationHelper
  def login_link
    if current_user
      link_to "Wyloguj", destroy_user_session_path, method: "delete", class: "sf-block"
    else
      link_to "Zaloguj", new_user_session_path, class: "sf-block"
    end
  end
end
