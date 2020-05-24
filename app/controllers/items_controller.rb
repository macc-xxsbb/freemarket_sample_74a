class ItemsController < ApplicationController

  def index
    @item = Item.includes(:item_images, :brands, :shippings).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    @brand = Brand.new
    @shipping = Shipping.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      item_id = @item.id
      @brand = Brand.new(brand_params.merge(item_id: item_id))
      @shipping = Shipping.new(shipping_params.merge(item_id: item_id)) 
      if @brand.save && @shipping.save
        redirect_to root_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @categories = Category.select("title")
  end

  private

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def item_params
      params.require(:item).permit(:item_name, :price, :size, :content, :category_id, :status_id, item_images_attributes: [:image]).merge(user_id: 1)
    end

    def brand_params  
      params.require(:brand).permit(:brand)
    end

    def shipping_params  
      params.require(:shipping).permit(:ship_base, :region, :city, :block, :ship_method, :ship_date, :prefecture_id)
    end

end