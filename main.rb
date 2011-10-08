require 'rubygems'
require 'sinatra'

# @location
# @destination
# set :variable, etc

get '/' do
	@coords = "console.log('test');"
	erb :index
end
