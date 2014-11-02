class ParticipantsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    event = Event.find(params[:event_id])
    event.participants << current_user
    redirect_to event
  end

  def update
  end

  def destroy
    EventsParticipant.where(event_id: params[:event_id], participant_id: params[:id])[0].destroy()
    redirect_to Event.find(params[:event_id])
  end
end