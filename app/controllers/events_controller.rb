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
    @event = event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
