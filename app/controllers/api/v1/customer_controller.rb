
require './app/services/customer_signup'
require './app/services/parse_url'

class Api::V1::CustomerController < ApplicationController

  def index
    @customer = CustomerSignup.new
    # render json: @customer, status: 200
    # redirect_to 'https://lifeapp.page.link/j5Ff', allow_other_host: true
    # @customer = @customer.values.slice!(0).values_at(:url).slice!(0)
    puts "This is the global $URL: #{$url}"
    redirect_to $url, allow_other_host: true
  end

  def show

  end
end
