class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.all
    @future_events = Event.future
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :date)
  end
end
