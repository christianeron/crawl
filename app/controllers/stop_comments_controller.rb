class StopCommentsController < ApplicationController
  def index
    matching_stop_comments = StopComment.all

    @list_of_stop_comments = matching_stop_comments.order({ :created_at => :desc })

    render({ :template => "stop_comments/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stop_comments = StopComment.where({ :id => the_id })

    @the_stop_comment = matching_stop_comments.at(0)

    render({ :template => "stop_comments/show" })
  end

  def create
    the_stop_comment = StopComment.new
    the_stop_comment.stop_id = params.fetch("query_stop_id")
    the_stop_comment.user_id = params.fetch("query_user_id")
    the_stop_comment.comment = params.fetch("query_comment")

    if the_stop_comment.valid?
      the_stop_comment.save
      redirect_to("/stop_comments", { :notice => "Stop comment created successfully." })
    else
      redirect_to("/stop_comments", { :alert => the_stop_comment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_stop_comment = StopComment.where({ :id => the_id }).at(0)

    the_stop_comment.stop_id = params.fetch("query_stop_id")
    the_stop_comment.user_id = params.fetch("query_user_id")
    the_stop_comment.comment = params.fetch("query_comment")

    if the_stop_comment.valid?
      the_stop_comment.save
      redirect_to("/stop_comments/#{the_stop_comment.id}", { :notice => "Stop comment updated successfully."} )
    else
      redirect_to("/stop_comments/#{the_stop_comment.id}", { :alert => the_stop_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_stop_comment = StopComment.where({ :id => the_id }).at(0)

    the_stop_comment.destroy

    redirect_to("/stop_comments", { :notice => "Stop comment deleted successfully."} )
  end
end
