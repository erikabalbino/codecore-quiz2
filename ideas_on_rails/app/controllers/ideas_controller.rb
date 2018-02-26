class IdeasController < ApplicationController

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def show
    @idea = Idea.find params[:id]
    # @comment = Comment.new
    # @comments = @post.comments.order(created_at: :desc)
  end

  def new
    # render plain: "OK!"
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    # @idea.user = current_user

    if @idea.save
      redirect_to '/'
      # redirect_to idea_path(@idea)
    else
      render :new
    end

    # render json: params.require(:post)

  end

  def edit
    @idea = Idea.find params[:id]
  end

  def update
    @idea = Idea.find params[:id]

    if @idea.update idea_params
      redirect_to '/'
      # redirect_to ideas_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find params[:id]

    @idea.destroy

    redirect_to '/'
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
