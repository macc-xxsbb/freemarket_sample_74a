class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.all
  end

  def show
    # @item = Item.find(params[:id])
    @categories = Category.select("title")
    # @comment = comment.new
  end
  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  def new
  end

end