class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @idea = Idea.new
    @ideas = Idea.all.order('created_at DESC')
  end

  def new
		@idea = Idea.new
    @ideas = current_user.ideas.build
  end

  def create
    # @idea = Idea.new(idea_params)
    @idea = current_user.ideas.build(idea_params)
     if @idea.save
    redirect_to @idea
  else
    render 'new'
  end
end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update (params[:idea].permit(:title, :body))
      redirect_to @idea
    else
      render 'edit'
  end
end

def destroy
  @idea = Idea.find(params[:id])
  @idea.destroy

  redirect_to ideas_path

end
  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
