class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.includes(:item_images, :brands, :shippings).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
    # @item.brands.new
    # @item.shippings.new
    @brand = Brand.new
    @shipping = Shipping.new
  end

  def create
    # ActiveRecord::Base.transaction do
    #   @item = Item.new(item_params)
    #   @item.save!
    #   @brand = Brand.new(brand_params)
    #   @brand.save!
    #   @shipping = Shipping.new(shipping_params)
    #   @shipping.save!
    # end
    #   redirect_to root_path
    # rescue
    #   render :new

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
    # @item = Item.find(params[:id])
    @categories = Category.select("title")
    # @comment = comment.new
  end

  private

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
    
    def item_params
      params.require(:item).permit(:item_name, :price, :size, :content, :status, item_images_attributes: [:image]).merge(user_id: 1)
      # , brands_attributes: [:brand], shippings_attributes: [:ship_base, :region, :city, :block, :ship_method, :ship_date]
    end

    def brand_params  
      params.require(:brand).permit(:brand)
    end
  
    def shipping_params  
      params.require(:shipping).permit(:ship_base, :region, :city, :block, :ship_method, :ship_date)
    end

end