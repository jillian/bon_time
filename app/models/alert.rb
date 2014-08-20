class TwilioAlert

  def initialize content, number
    @content, @to_number = content, number
    self 
    #otherwise you don't have access ot instance methods
    #assigning variables returns nil, we want it to return the instance so we can send it
  end

  def client
    @client ||= Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_AUTH"])
  end

  def send 
    client.account.sms.messages.create(
      body: @content,
      to: @to_number,
      from: ENV["TWILIO_NUM"]
      )
  end #This is an instance method. Called directly after new, which calls initialize
end