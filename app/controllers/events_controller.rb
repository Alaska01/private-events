class EventsController < ApplicationController
    def create
        @meeting = current_user.meetings.build(meeting_params)
        if @meeting.save
          flash[:notice] = 'Event was created successfully'
          redirect_to meetings_path
        else
          flash[:alert] = 'Woops something went wrong'
          render 'new'
        end
    end
end
