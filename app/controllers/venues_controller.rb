class VenuesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params.merge(user_id: current_user.id, event_id: params[:event_id]))
    if @venue.save
      p "*"*100
      p @venue
      p "*"*100
      redirect_to Event.find(@venue.event_id)
    end
  end

  def update
  end

  def destroy
  end

  private
    def venue_params
      params.require(:venue).permit!
    end
end
