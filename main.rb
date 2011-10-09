require 'rubygems'
require 'sinatra'
require 'mysql'
require 'sequel'

# set :database => 'mysql://appathon:appathon@appathon.cdmwtnbgpare.eu-west-1.rds.amazonaws.com:3306/appathon'
# DB = Sequel.mysql 'appathon', :user => 'appathon', :password => 'appathon', :host => 'mysql://appathon.cdmwtnbgpare.eu-west-1.rds.amazonaws.com', :port => '3306'
DB = Sequel.connect('mysql://appathon:appathon@appathon.cdmwtnbgpare.eu-west-1.rds.amazonaws.com:3306/appathon')

get '/' do
	@coords = {}
	@buses = {}
	erb :index
end

get '/app' do
#	@coords = ["55.9449704019074,-3.193202018737793","55.9518396,-3.1647041"]
  	@coords = {"51.450402, 0.195193" => 13,"51.450, 0.196193" => 8, "51.459, 0.197"=> 18, "51.449, 0.1955" => 10, "51.451, 0.196" => 8, "51.460, 0.190" => 1, "51.453, 0.190" => 24, "51.452, 0.193"=>3, "51.4525, 0.192"=> 10}
	@buses = {"51.4539, 0.185"=> 1}
  	erb :app
end

def get_crimes_and_format
	# location = ?? 
	# polygon = "GeomFromtext('Polygon((#{location[x]-100} #{location[y]-100},#{location[x]+100} #{location[y]-100},#{location[x]+100} #{location[y]+100},#{location[x]-100} #{location[y]+100},#{location[x]-100} #{location[y]-100}))'"
	rows = DB.fetch("SELECT * FROM street_crime WHERE MBRContains(GeomFromText('Polygon((359726 170526,359926 170526,359926 170726,359726 170726,359726 170526))'), ukos);")
	
	myHash = {}
	rows.each{ |row|
		key = '"'+row[:easting].to_s+','+row[:northing].to_s + '"'
		myHash[key].nil? ? myHash[key] = 1 : myHash[key] += 1
	}
	return myHash
end

get '/dbtest' do
	@coords = get_crimes_and_format
	erb :index
end
