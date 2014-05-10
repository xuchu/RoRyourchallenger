module ApplicationHelper
  def add_classes_to_body
    if signed_in?
      "logged-in"
    else
      "not-logged-in"
    end
  end

  def render_side_menu
    render partial:"users/side_menu", locals: {user: current_user} if signed_in?
  end
end
