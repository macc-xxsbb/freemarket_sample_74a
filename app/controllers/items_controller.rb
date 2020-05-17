class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  def index
  
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.find(params[:id])
    @brand = Brand.find(params[:id])
    @shipping = Shipping.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  def post_params
    params.require(:item).permit(:item_name, :size, :price, :content, :status).merge(user_id: current_user.id)
  end

  def new
  end

end

