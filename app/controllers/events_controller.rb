class EventsController < ApplicationController
  before_action :find_event_and_venue, only: [:show]

  def index
    @events = Event.all.order('start_date asc')
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params.merge(host_id: current_user.id))

    if @event.save
      redirect_to new_event_venue_path(@event)
    end
  end

  def update
  end

  def destroy
  end

  private
    def find_event_and_venue
      @event = Event.find(params[:id])
      @venue = @event.venues[0]
      @host = @event.host
      @participants = @event.participants
    end

    def event_params
      params.require(:event).permit!
    end
end
