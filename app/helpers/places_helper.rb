module PlacesHelper
  def login_status
    if !logged_in?
      return "#{link_to 'Login', authenticated_system_login_path}".html_safe
    else
      return "#{current_user.login}. #{is_admin_area? ? link_to(ts('view.this'), root_path) : link_to(ts('edit.this'), admin_root_path) } | #{link_to 'Logout', authenticated_system_logout_path}.".html_safe
    end
  end
end