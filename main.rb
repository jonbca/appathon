require 'rubygems'
require 'sinatra'

# @location
# @destination
# set :variable, etc

get '/' do
	@message = "Hello safe night bus app!"
	erb :hello
end
