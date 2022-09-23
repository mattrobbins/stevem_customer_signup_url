require 'json'

class ParseUrl

  def initialize(customer)
    get_url(customer)
  end

  def get_url(customer)
    puts "HI BOB"
    puts "The class of customer: #{customer.class}"
      # @url = customer.values.slice!(0).values_at(:url).slice!(0)
  end

end
