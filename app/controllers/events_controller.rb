class EventsController < ApplicationController
  def index

  		auth = '8v8e392tsgodst1gormrilfnh2'
  		key = '431867407442112c2313c6678a426e'
		  	# @response = HTTParty.get("https://api.meetup.com/2/events?key=431867407442112c2313c6678a426e&group_urlname=ny-tech&sign=true")

		if params[:search]
			 
			 @results = HTTParty.get("https://api.meetup.com/2/open_events?category=34&zip=95131&radius=50&text=#{params[:search]}&time=,#{params[:date]}&key=431867407442112c2313c6678a426e&sign=true")

			 puts "https://api.meetup.com/2/open_events?category=34&zip=95131&radius=50&text=#{params[:search]}&time=#{params[:date]}&key=431867407442112c2313c6678a426e&sign=true"

		else 

		  	@results = HTTParty.get("https://api.meetup.com/2/open_events?category=34&zip=95131&radius=50&key=431867407442112c2313c6678a426e&sign=true")
		end
		  	@events = @results['results']

		  	@events.each do |event|
		  		event['datetime'] = Time.at(event['time']/1000).strftime("%m-%d-%Y %H:%M:%S")
	  		
			end

	end

  def show
		  	@show = HTTParty.get("https://api.meetup.com/2/event/#{params[:id]}?&key=431867407442112c2313c6678a426e&sign=true")

		  	@show['datetime'] = Time.at(@show['time']/1000).strftime("%m-%d-%Y %H:%M:%S")
		  	

  end

  def login

  end
end
