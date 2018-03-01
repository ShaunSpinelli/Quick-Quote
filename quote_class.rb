require 'mail'
require 'twilio-ruby'

# put your own credentials here
# account_sid = 'ACf503a3a205fd784b4e8a185214772cbb'
# auth_token = 'b9c18d50b5f2bb3004b22c01e55f09f6'

# # set up a client to talk to the Twilio REST API
# client = Twilio::REST::Client.new account_sid, auth_token


class Quote
    attr_accessor :jobs, :distance_cost, :location

    def initialize(jobs, distance_cost, location, user_contacts)
        @jobs = jobs
        @distance_cost = distance_cost
        @location = location
        @user_email = user_email
        # @quote_1 = "Job:
        # -#{@jobs[:name]}
        # -#{@jobs[:cost]}
        # -#{@jobs[:time]}
        # Travel to #{location}:
        # -#{@distance_cost}
        # Totol:
        # -#{@distance_cost + @jobs[:cost]}"
        # #@client = client
    end

  def write_quote
    open('your_quote.txt', 'w') { |f| f << "#{@quote_1}" }
  end

  def put_quote
    puts @quote_1
  end

  # def email_quote
  #   mail = Mail.new do
  #   from    'QuickQuoteTest@email.com'
  #   to      "#{@user_email}"
  #   subject 'Your Quick Quote'
  #   body    File.read('your_quote.txt')
  #   end
  # mail.to_s
  # end
 

  def text_quote
    account_sid = 'ACf503a3a205fd784b4e8a185214772cbb'
    auth_token = 'b9c18d50b5f2bb3004b22c01e55f09f6'
    
    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new account_sid, auth_token
    client.api.account.messages.create(
  from: '+61428189153',
  to: '+',
  body: 'test'#"#{@quote_1}"
)
  end
end

