module ApplicationHelper
  def render_navigation_bar
    render partial:"users/navbar", locals: {user: current_user} if signed_in?
  end
end
