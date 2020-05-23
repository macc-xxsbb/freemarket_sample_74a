class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @item = Item.includes(:item_images, :brands, :shippings).order('created_at DESC')
    @newItems = Item.includes(:item_images).where(buyer_id: nil).limit(3)

  end

  def new
    @item = Item.new
    @item.item_images.new
    @brand = Brand.new
    @shipping = Shipping.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      item_id = @item.id
      @brand = Brand.new(brand_params.merge(item_id: item_id))
      @shipping = Shipping.new(shipping_params.merge(item_id: item_id)) 
      if @brand.save! && @shipping.save!
        redirect_to root_path
      else
        render :new
      end
    else
      render :new
    end
  end 

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @categories = Category.find(params[:id])
    @brand = Brand.find(params[:id])
    @shipping = Shipping.find(params[:id])
    @images = ItemImage.all
    # binding.pry
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
    
  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :buyer_id, :size, :content, :status, item_images_attributes: [:image]).merge(user_id: 1, saler_id: current_user.id)
  end

  def brand_params  
    params.require(:brand).permit(:brand)
  end

  def shipping_params  
    params.require(:shipping).permit(:ship_base, :region, :city, :block, :ship_method, :ship_date)
  end

end

