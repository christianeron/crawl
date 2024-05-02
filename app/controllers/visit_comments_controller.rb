class VisitCommentsController < ApplicationController
  def index
    matching_visit_comments = VisitComment.all

    @list_of_visit_comments = matching_visit_comments.order({ :created_at => :desc })

    render({ :template => "visit_comments/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_visit_comments = VisitComment.where({ :id => the_id })

    @the_visit_comment = matching_visit_comments.at(0)

    render({ :template => "visit_comments/show" })
  end

  def create
    the_visit_comment = VisitComment.new
    the_visit_comment.user_id = params.fetch("query_user_id")
    the_visit_comment.visit_id = params.fetch("query_visit_id")
    the_visit_comment.comment = params.fetch("query_comment")

    if the_visit_comment.valid?
      the_visit_comment.save
      redirect_to("/visit_comments", { :notice => "Visit comment created successfully." })
    else
      redirect_to("/visit_comments", { :alert => the_visit_comment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_visit_comment = VisitComment.where({ :id => the_id }).at(0)

    the_visit_comment.user_id = params.fetch("query_user_id")
    the_visit_comment.visit_id = params.fetch("query_visit_id")
    the_visit_comment.comment = params.fetch("query_comment")

    if the_visit_comment.valid?
      the_visit_comment.save
      redirect_to("/visit_comments/#{the_visit_comment.id}", { :notice => "Visit comment updated successfully."} )
    else
      redirect_to("/visit_comments/#{the_visit_comment.id}", { :alert => the_visit_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_visit_comment = VisitComment.where({ :id => the_id }).at(0)

    the_visit_comment.destroy

    redirect_to("/visit_comments", { :notice => "Visit comment deleted successfully."} )
  end
end
