# Appathon 2011 #
Our App idea for Appathon is to create a system that will allow users to find a safe route home, via public transport.

## Use Case ##
Johnny is lost in Leith. He wants to find the safest way home from the nearest bus stop. So, he pulls out his smartphone and navigates to our site. The site gets his location using the phone's GPS, and displays a map with the nearest bus stops, overlayed with a heat map or a collection of icons representing reported crime in the area. He can then find his way to the bus stop safely, without worrying about crime.

The app could also be given a postcode for a destination, and give you directions on public transport from your current location.

## Data Sources ##
We will need:
* The NaPTAN data from [here](http://data.gov.uk/dataset/naptan). This gives us the locations of all Public Transport nodes in Great Britain, including station, coach terminals, airports, ferry terminals, and most importantly, bus stops!
* Some crime data. Probably from www.police.uk, which has [an api](www.police.uk/api/docs).
* Google maps, and the related [maps api](code.google.com/apis/maps/index.html), [directions api](http://code.google.com/apis/maps/documentation/directions/), and [overlays api](code.google.com/apis/maps/documentation/javascript/overlays.html) (probably).

We may also need:
* The NPTDR data from [here](http://data.gov.uk/dataset/nptdr). This contains a snapshot of all public transport journeys.

## Structure ##
Web UI, probably coded in Python (django). Most likely hosted on Amazon EC2.
