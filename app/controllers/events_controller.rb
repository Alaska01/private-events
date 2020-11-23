class EventsController < ApplicationController
  def index
    @meetings = Meeting.all
    # @pasts = current_user.attended_events.past
    # @meetings = Meeting.upcoming 
    @past_events = Meeting.past
    @future_events = Meeting.future

  end
  
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

    def show
      @meeting = Meeting.find(params[:id])
  end

end
