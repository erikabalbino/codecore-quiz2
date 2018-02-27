class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, except: [:new, :index, :create]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def show
    # @idea = Idea.find params[:id]
    @review = Review.new
    @reviews = @idea.reviews.order(created_at: :desc)
  end

  def new
    # render plain: "OK!"
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user

    if @idea.save
      redirect_to '/'
      # redirect_to idea_path(@idea)
    else
      render :new
    end

    # render json: params.require(:post)

  end

  def edit
    # @idea = Idea.find params[:id]
  end

  def update
    # @idea = Idea.find params[:id]

    if @idea.update idea_params
      redirect_to '/'
      # redirect_to ideas_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    # @idea = Idea.find params[:id]

    @idea.destroy

    redirect_to '/'
  end

  private
  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def authorize_user!
    unless can?(:manage, @idea)
      flash[:alert] = 'Access Denied!'
      redirect_to idea_path(@idea)
    end
  end

end
