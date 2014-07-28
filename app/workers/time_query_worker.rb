class TimeQueryWorker 
  include Sidekiq::Worker

  def perform(event_id)
    @mobile_number = event.attendances.first.user.mobile_number
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.account.messages.create({
        :to => "+13216851234",
        :from => "+15555555555",
        :body => "Hello!"})

    #can take whatever arguments
    #fetch event and figure out all the people that need to be alerted

    # perform...       TimeQueryWorker.new.perform(1) - run now in console
    # perform_async... TimeQueryWorker.perform_async(1) - run ASAP via sidekiq

    # alert_time = event.start_time - attendance.trip_duration - 10.minutes
    # TimeQueryWorker.perform_at(alert_time, 1)

    # Make twilio SMS the user
  end
end
