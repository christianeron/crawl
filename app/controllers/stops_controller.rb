class StopsController < ApplicationController
  def index
    matching_stops = Stop.all

    @list_of_stops = matching_stops.order({ :crawl_id => :asc , :order_number => :asc })

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
    the_stop.recommendation = params.fetch("query_recommendation")

    if the_stop.valid?
      the_stop.save
      redirect_to("/crawls/#{the_stop.crawl_id}", { :notice => "Stop created successfully." })
    else
      redirect_to("/crawls/#{the_stop.crawl_id}", { :alert => the_stop.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("query_stop_id")
    the_stop = Stop.where({ :id => the_id }).at(0)
    the_stop.recommendation = params.fetch("query_recommendation")

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

  def rearrange
    the_id = params.fetch("path_id")
    the_crawl = Crawl.where({ :id => the_id }).at(0)

    the_stops = Stop.where(:crawl_id => the_crawl.id)

    stop_order = Array.new

    # Check for order validity
    the_stops.order(:order_number).each_with_index do |the_stop, index|
      stop_order = stop_order.push(params.fetch("query_order_number_#{index}"))
    end

    sorted_stop_order = stop_order.sort
    is_valid = true
    
    sorted_stop_order.each_with_index do |the_num, index|
      if the_num != (index + 1).to_s
        is_valid = false
      end
    end

    if is_valid == true
      the_stops.order(:order_number).each_with_index do |the_stop, index|

        the_stop.order_number = params.fetch("query_order_number_#{index}")
        if the_stop.valid?
          the_stop.save
        end
      end
      redirect_to("/crawls/#{the_id}", { :notice => "Stop order updated successfully."} )

    else
      redirect_to("/crawls/#{the_id}", { :alert => "Numbering was not valid" })
    end
  end

end
