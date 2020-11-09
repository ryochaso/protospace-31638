class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  
  def index
    @prototypes = Prototype.all
    # query = "SELECT * FROM prototypes"
    # @prototypes = Prototype.find_by_sql(query)
  end

  def new
     @prototype = Prototype.new
  end
  
  def create
    
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
        redirect_to root_path
    else
        render :new
    end

  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
    redirect_to root_path
    end
    
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save 
        redirect_to prototype_path, method: :get
    else 
        render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    if @prototype.destroy
        redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end




end
