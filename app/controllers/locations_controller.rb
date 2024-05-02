class LocationsController < ApplicationController
  def index
    matching_locations = Location.all

    @list_of_locations = matching_locations.order({ :created_at => :desc })

    render({ :template => "locations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_locations = Location.where({ :id => the_id })

    @the_location = matching_locations.at(0)

    render({ :template => "locations/show" })
  end

  def create
    the_location = Location.new
    the_location.name = params.fetch("query_name")
    the_location.street_address = params.fetch("query_street_address")
    the_location.street_address_2 = params.fetch("query_street_address_2")
    the_location.city = params.fetch("query_city")
    the_location.state = params.fetch("query_state")
    the_location.zip_code = params.fetch("query_zip_code")

    if the_location.valid?
      the_location.save
      redirect_to("/locations", { :notice => "Location created successfully." })
    else
      redirect_to("/locations", { :alert => the_location.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_location = Location.where({ :id => the_id }).at(0)

    the_location.name = params.fetch("query_name")
    the_location.street_address = params.fetch("query_street_address")
    the_location.street_address_2 = params.fetch("query_street_address_2")
    the_location.city = params.fetch("query_city")
    the_location.state = params.fetch("query_state")
    the_location.zip_code = params.fetch("query_zip_code")

    if the_location.valid?
      the_location.save
      redirect_to("/locations/#{the_location.id}", { :notice => "Location updated successfully."} )
    else
      redirect_to("/locations/#{the_location.id}", { :alert => the_location.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_location = Location.where({ :id => the_id }).at(0)

    the_location.destroy

    redirect_to("/locations", { :notice => "Location deleted successfully."} )
  end
end
