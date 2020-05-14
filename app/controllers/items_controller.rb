class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
    # @item = Item.find(params[:id])
    @categories = Category.select("title")
    # @comment = comment.new
    
  end

  def new
  end

end