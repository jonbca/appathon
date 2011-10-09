require 'rubygems'
require 'sinatra'
require 'sequel'

# set :database => 'mysql://appathon:appathon@appathon.cdmwtnbgpare.eu-west-1.rds.amazonaws.com:3306/appathon'
# DB = Sequel.mysql 'appathon', :user => 'appathon', :password => 'appathon', :host => 'mysql://appathon.cdmwtnbgpare.eu-west-1.rds.amazonaws.com', :port => '3306'
DB = Sequel.connect('mysql://appathon:appathon@appathon.cdmwtnbgpare.eu-west-1.rds.amazonaws.com:3306/appathon')

get '/' do
	@coords = ["55.9449704019074,-3.193202018737793","55.9518396,-3.1647041"]
	erb :index
end

def get_crimes_and_format
	rows = DB.fetch("SELECT * FROM street_crime WHERE MBRContains(GeomFromText('Polygon((359825.0 170625.0,359827 170625,359827 170627,359825 170627,359825 170625))'), ukos);")
	@string = '["'
	rows.each{ |row| @string << row[:easting].to_s+','+row[:northing].to_s+'","' }
	@string << rows.first[:easting].to_s+','+rows.first[:northing].to_s+'"]'
	puts @string
	return @string
end

get '/dbtest' do
	get_crimes_and_format
end
