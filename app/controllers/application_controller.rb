class ApplicationController < ActionController::Base

  def home
    render({ :template => "home.html.erb" })
  end

  def array_of_conversions 
    exchange_rate = "https://api.exchangerate.host/symbols"
    data = open(exchange_rate).read
    parsed_data = JSON.parse(data)
    return parsed_data["symbols"].keys
  end

  def forex
    @array_of_conversions = array_of_conversions()

    render({ :template => "forex.html.erb" })
  end

  def conversion_1
    @conversion_a = params.fetch("conversion_1")
    
    @array_of_conversions = array_of_conversions()

    render({ :template => "conversion_1.html.erb" })
  end

  def conversion_2
    @conversion_a = params.fetch("conversion_1")
    @conversion_b = params.fetch("conversion_2")

    rate_converted = "https://api.exchangerate.host/convert?from=#{@conversion_a}&to=#{@conversion_b}"
    data = open(rate_converted).read
    parsed_data = JSON.parse(data)
    @rate = parsed_data["info"]["rate"]

    render({ :template => "conversion_2.html.erb" })
  end

  def covid
    render({ :template => "covid.html.erb" })
  end

end
