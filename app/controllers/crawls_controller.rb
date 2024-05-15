class CrawlsController < ApplicationController

  def index
    all_crawls = Crawl.all

    @list_of_crawls = Crawl.all.order({ :created_at => :desc })

    @categories = Category.all.order("name")

    render({ :template => "crawls/index" })
  end

  def show
    require "http"
    require "json"

    the_id = params.fetch("path_id")

    matching_crawls = Crawl.where({ :id => the_id })

    @the_crawl = matching_crawls.at(0)
    @categories = Category.all.order("name")

    gmaps_key = ENV.fetch("GMAPS_KEY")

    @stop_locations = Array.new
    
    @the_crawl.stops.each do |a_stop|
      stop_order_number = a_stop.order_number

      location = "#{a_stop.location.street_address},#{a_stop.location.street_address_2},#{a_stop.location.city},#{a_stop.location.state},#{a_stop.location.zip_code}"
      location = location.gsub(" ","%20")

      location_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{gmaps_key}"

      returned_location = HTTP.get(location_url)
      parsed_location = JSON.parse(returned_location)
      location_results = parsed_location.fetch("results")[0].fetch("geometry").fetch("location")

      stop_latitude = location_results.fetch("lat")
      stop_longitude = location_results.fetch("lng")

      @stop_locations = @stop_locations.push({:name=> a_stop.location.name, :num => stop_order_number, :lat => stop_latitude, :lng => stop_longitude})

    end
    
    @map_call = "https://maps.googleapis.com/maps/api/js?key=#{gmaps_key}&callback=initMap"

    render({ :template => "crawls/show" })
  end

  def create
    the_crawl = Crawl.new
    the_crawl.name = params.fetch("query_name")
    the_crawl.category_id = params.fetch("query_category_id")
    the_crawl.city = params.fetch("query_city")
    the_crawl.state = params.fetch("query_state")
    the_crawl.user_id = params.fetch("query_user_id")
    the_crawl.photo = params.fetch("query_photo")

    if the_crawl.valid?
      the_crawl.save
      redirect_to("/crawls/#{the_crawl.id}", { :notice => "Crawl created successfully." })
    else
      redirect_to("/crawls", { :alert => the_crawl.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_crawl = Crawl.where({ :id => the_id }).at(0)

    the_crawl.name = params.fetch("query_name")
    the_crawl.category_id = params.fetch("query_category_id")
    the_crawl.city = params.fetch("query_city")
    the_crawl.state = params.fetch("query_state")
    the_crawl.user_id = params.fetch("query_user_id")
    the_crawl.photo = params.fetch("query_photo")
    
    if the_crawl.valid?
      the_crawl.save
      redirect_to("/crawls/#{the_crawl.id}", { :notice => "Crawl updated successfully."} )
    else
      redirect_to("/crawls/#{the_crawl.id}", { :alert => the_crawl.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_crawl = Crawl.where({ :id => the_id }).at(0)

    the_crawl.destroy

    redirect_to("/crawls", { :notice => "Crawl deleted successfully."} )
  end

  def my_crawls

    render({ :template => "crawls/my_crawls" })
  end

  def user_crawls
    the_id = params.fetch("path_id")

    @the_user = User.all.where(:id => the_id).at(0)

    render({ :template => "crawls/user_crawls" })
  end


end
