require 'rubygems'
require 'sinatra'

# @location
# @destination
# set :variable, etc

get '/' do
	@coords = ["55.9449704019074,-3.193202018737793","55.9518396,-3.1647041"]
	erb :index
end
