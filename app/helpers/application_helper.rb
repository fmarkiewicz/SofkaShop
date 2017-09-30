module ApplicationHelper
  def login_link
    if current_user
      link_to "Wyloguj", destroy_user_session_path, method: "delete"
    else
      link_to "Zaloguj", new_user_session_path
    end
  end

  def price_in_float(price_in_int)
    sprintf('%.2f zł', price_in_int/100)
  end  
end
