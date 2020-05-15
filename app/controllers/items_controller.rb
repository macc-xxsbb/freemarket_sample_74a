class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    @brand = Brand.new
    @shipping = Shipping.new
  end

  def create
    Item.create(item_params)
    Brand.create(brand_params)
    Shipping.create(shipping_params)
    redirect_to root_path
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
  
  def item_params
    params.require(:item).permit(:item_name, :price, :size, :content, :status, item_images_attributes: [:image])
  end

  def brand_params  
    params.require(:brand).permit(:brand)
  end

  def shipping_params  
    params.require(:shipping).permit(:ship_base, :region, :city, :block, :ship_method, :ship_date).merge(item_id: params[:item_id])
  end

end