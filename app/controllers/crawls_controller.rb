class CrawlsController < ApplicationController
  def index
    matching_crawls = Crawl.all

    @list_of_crawls = matching_crawls.order({ :created_at => :desc })

    render({ :template => "crawls/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_crawls = Crawl.where({ :id => the_id })

    @the_crawl = matching_crawls.at(0)

    render({ :template => "crawls/show" })
  end

  def create
    the_crawl = Crawl.new
    the_crawl.name = params.fetch("query_name")
    the_crawl.category_id = params.fetch("query_category_id")
    the_crawl.city = params.fetch("query_city")
    the_crawl.state = params.fetch("query_state")
    the_crawl.user_id = params.fetch("query_user_id")

    if the_crawl.valid?
      the_crawl.save
      redirect_to("/crawls", { :notice => "Crawl created successfully." })
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
end
