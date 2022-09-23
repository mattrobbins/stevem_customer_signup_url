require 'json'

class CustomerSignup
  include HTTParty

  def initialize
    get_url
  end

  def get_url
    options = {
      headers: {
        "Accept-Application" => "application/json"
      },
      body: {
        "username" => ENV["username"],
        "password" => ENV["password"]
      }
    }

    response = HTTParty.post('https://my.lifeinfoapp.com/api/signin', options)

    body = JSON.parse(response.body)
    token = body['access_token']

    options2 = {
      headers: {
        "Authorization" => "Bearer #{token}",
        "Accept-Application" => "application/json"
      }
    }
    # Top Customer URL
    # response = HTTParty.get('https://prod.apimainhomepage.com/api/enroll/customer/topcustomer/en',
    # options2)
    # Starfish Enrollment url#
    @response = HTTParty.get('https://prod.apimainhomepage.com/api/enroll/customer/starfish/en', options2)
    # @response = HTTParty.get('https://prod.apimainhomepage.com/api/enroll/customer/superapp/en',
        # options2)
    # Getting the URL out of the response
    # puts "This is the values.slice value: #{JSON.parse(@response.body).values.slice!(0)}"
    # puts "This is the class of the above: #{JSON.parse(@response.body).values.slice!(0).class}"
    $url = JSON.parse(@response.body).values.slice!(0)
    @response = JSON.parse(@response.body)

  end
end
