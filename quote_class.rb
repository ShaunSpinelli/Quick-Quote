require 'mail'
require 'twilio-ruby'
require 'gmail_sender'

location = "perth"
distance_cost = 400
jobs = [
    {name:"Small shed", materials_cost: 100, time: 45}, # read and create array of jobs from txt using marshall
    {name:"Big shed", materials_cost: 100, time: 45}
]


class Quote
    attr_accessor :jobs, :distance_cost, :location

    def initialize(jobs, distance_cost, location)
        @jobs = jobs
        @distance_cost = distance_cost
        @location = location
        # @user_email = user_email
        @quote_1 =
        "Job:
 - #{@jobs[0][:name]}
 - #{@jobs[0][:cost].to_i}
 - #{@jobs[0][:time].to_i}
 Travel to #{location}:
 - #{@distance_cost}
 Totol:
 - #{@distance_cost + @jobs[0][:cost].to_i}".ljust(20)
    end

    def write_quote
      open('your_quote.txt', 'w') { |f| f << "#{@quote_1}" }
    end

    def put_quote
      puts @quote_1
    end


    def email_quote
    g = GmailSender.new("quickquoteruby@gmail.com", "HelloWorld123")
    # you can attach any number of files, but there are limits for total attachments size
    g.attach('/Users/claytonwaldock/Desktop/Quick-Quote-master/your_quote.txt')
    g.send(:to => "quickquoteruby@gmail.com",
           :subject => "Your Quick Quote",
           :content =>
"Dear Client,

please find attatched your own personal Quick Quote.

Best wishes,
The Quick Quote team!")
    end

  def text_quote
    account_sid = 'ACf503a3a205fd784b4e8a185214772cbb'
    auth_token = 'b9c18d50b5f2bb3004b22c01e55f09f6'

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new account_sid, auth_token
    client.api.account.messages.create(
    from: '+61428189153',
    to: '+61436481999',
    body: "#{@quote_1}"
    )
  end
end

quote = Quote.new(jobs, distance_cost, location)
quote.put_quote
quote.text_quote
quote.write_quote
quote.email_quote
