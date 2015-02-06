class CommentsController < ApplicationController
  def new
    @concert = Concert.find(params[:concert_id])
    @comment = @concert.comments.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    @comment = @concert.comments.new(edit_params)

    if @comment.save
      redirect_to(controller: 'site', action: 'home')
    else
      flash[:error] = "Please, check errors"
      render('new')
    end
  end

  def index
    # <%= render partial: 'shared/concert_list', locals: {concert: @concert} %>
    @concert = Concert.find(params[:concert_id])
    @comments = @concert.comments
  end

  private

  def edit_params
    params.require(:comment).permit(:author, :comment)
  end
end
