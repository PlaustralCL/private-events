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
    @users = User.all.order(:name)
  end

  def create
    # @event = current_user.events.build(event_params)
    @event = current_user.events.build(title: event_params[:title],
                                       location: event_params[:location],
                                       date: event_params[:date],
                                       description: event_params[:description],
                                       attendees: event_params[:attendees].map { |id| User.find(id) })

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @users = User.all.order(:name)
    unless current_user.id == @event.creator_id
      redirect_to @event,
                  alert: "You can only edit events you created"
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :date, {:attendees => []})
  end
