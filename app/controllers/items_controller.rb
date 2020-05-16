class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.includes(:item_images, :brands, :shippings).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    @item.brands.new
    @item.shippings.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    # Brand.create(brand_params)
    # Shipping.create(shipping_params)
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
    params.require(:item).permit(:item_name, :price, :size, :content, :status, item_images_attributes: [:image], brands_attributes: [:brand], shippings_attributes: [:ship_base, :region, :city, :block, :ship_method, :ship_date])
  end

end