module EventsHelper
    def display_attend_button(form)
        if current_user
          return form.submit "Attend"
         end
    end
end
