module ApplicationHelper
  def links_display
    links = ''
    if logged_in?
      links << link_to('Logout', logout_path, method: :delete)
      links << ' | '
      links << link_to('Create Post', new_event_path)
    else
      links << ' | '
      links << link_to('Log In', login_path)
      links << ' | '
      links << link_to('Sign Up', new_user_path)
    end
    links.html_safe
  end
end
