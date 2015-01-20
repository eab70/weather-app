require 'sinatra'
require 'yahoo_weatherman'


def weather_forecast(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['text']
end

def temp_forecast(location)
	client = Weatherman::Client.new(unit: "f")
	temp = client.lookup_by_location(location).condition['temp']
end

get '/' do
	erb :home
end

post '/weather' do
	location = params[:post] ['location']
	@weather = weather_forecast(location)
	@temp = temp_forecast(location)

if (@weather == 'Sunny')
        erb :sunny
    elsif (@weather == 'Cloudy')
        erb :cloudy
	elsif (@weather == 'Mostly Cloudy')
		erb :cloudy
	elsif (@weather == 'Partly Cloudy')
		erb :pcloudy
	elsif (@weather == 'Fair')
		erb :fair2
	elsif (@weather == 'Rainy')
		erb :rainy
	elsif (@weather == 'Rain')
		erb :rainy
	elsif (@weather == 'Snowy')
        erb :snowy
	elsif (@weather == 'Snow')
		erb :snowy
	elsif (@weather == 'Light Snow')
		erb :snowy
	else
        erb :noweather
    end
end


