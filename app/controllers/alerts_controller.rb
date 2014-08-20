class MessagesController < ApplicationController

  def create
    TextMessage.new(params[:content], "00447709642384").send
    redirect_to new_twilio_alert_path
  end

end