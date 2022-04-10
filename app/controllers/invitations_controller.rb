class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to "/events/#{@invitation.event_id}"
    else
      render :new
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :event_id)
  end
end
