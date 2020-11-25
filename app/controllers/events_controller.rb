class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past
    @future_events = Event.future
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Event was created successfully'
      redirect_to events_path
    else
      flash[:alert] = 'Woops something went wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def attend_event
    @event = Event.find(params[:format])
    @invitation = Invitation.new(attendee: current_user, attended_event: @event)
    if @invitation.save
      redirect_to event_path(@event)
    else
      render "event"
    end
  end

  def talk

  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
