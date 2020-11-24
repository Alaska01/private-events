module EventsHelper
  def display_attend_button(form)
    return form.submit 'Attend' if current_user
  end
end
