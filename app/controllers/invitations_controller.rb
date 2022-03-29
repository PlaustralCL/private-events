class InvitationsController < ApplicationController
  def new
    @invitation =  Invitation.new(event_id: params[:event_id], attendee_id: current_user.id)
  end

  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to "/events/#{@invitation.event_id}"
    else
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :event_id)
  end
end
