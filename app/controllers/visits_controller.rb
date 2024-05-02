class VisitsController < ApplicationController
  def index
    matching_visits = Visit.all

    @list_of_visits = matching_visits.order({ :created_at => :desc })

    render({ :template => "visits/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_visits = Visit.where({ :id => the_id })

    @the_visit = matching_visits.at(0)

    render({ :template => "visits/show" })
  end

  def create
    the_visit = Visit.new
    the_visit.user_id = params.fetch("query_user_id")
    the_visit.stop_id = params.fetch("query_stop_id")
    the_visit.rating = params.fetch("query_rating")
    the_visit.caption = params.fetch("query_caption")
    the_visit.photo = params.fetch("query_photo")

    if the_visit.valid?
      the_visit.save
      redirect_to("/visits", { :notice => "Visit created successfully." })
    else
      redirect_to("/visits", { :alert => the_visit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_visit = Visit.where({ :id => the_id }).at(0)

    the_visit.user_id = params.fetch("query_user_id")
    the_visit.stop_id = params.fetch("query_stop_id")
    the_visit.rating = params.fetch("query_rating")
    the_visit.caption = params.fetch("query_caption")
    the_visit.photo = params.fetch("query_photo")

    if the_visit.valid?
      the_visit.save
      redirect_to("/visits/#{the_visit.id}", { :notice => "Visit updated successfully."} )
    else
      redirect_to("/visits/#{the_visit.id}", { :alert => the_visit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_visit = Visit.where({ :id => the_id }).at(0)

    the_visit.destroy

    redirect_to("/visits", { :notice => "Visit deleted successfully."} )
  end
end
