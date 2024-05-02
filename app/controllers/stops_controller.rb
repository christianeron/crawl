class StopsController < ApplicationController
  def index
    matching_stops = Stop.all

    @list_of_stops = matching_stops.order({ :created_at => :desc })

    render({ :template => "stops/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stops = Stop.where({ :id => the_id })

    @the_stop = matching_stops.at(0)

    render({ :template => "stops/show" })
  end

  def create
    the_stop = Stop.new
    the_stop.crawl_id = params.fetch("query_crawl_id")
    the_stop.order_number = params.fetch("query_order_number")
    the_stop.location_id = params.fetch("query_location_id")
    the_stop.menu_recommendation = params.fetch("query_menu_recommendation")

    if the_stop.valid?
      the_stop.save
      redirect_to("/stops", { :notice => "Stop created successfully." })
    else
      redirect_to("/stops", { :alert => the_stop.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_stop = Stop.where({ :id => the_id }).at(0)

    the_stop.crawl_id = params.fetch("query_crawl_id")
    the_stop.order_number = params.fetch("query_order_number")
    the_stop.location_id = params.fetch("query_location_id")
    the_stop.menu_recommendation = params.fetch("query_menu_recommendation")

    if the_stop.valid?
      the_stop.save
      redirect_to("/stops/#{the_stop.id}", { :notice => "Stop updated successfully."} )
    else
      redirect_to("/stops/#{the_stop.id}", { :alert => the_stop.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_stop = Stop.where({ :id => the_id }).at(0)

    the_stop.destroy

    redirect_to("/stops", { :notice => "Stop deleted successfully."} )
  end
end
