require 'rubygems'
require 'sinatra'

# @location
# @destination
# set :variable, etc

get '/' do
	erb :index
end
