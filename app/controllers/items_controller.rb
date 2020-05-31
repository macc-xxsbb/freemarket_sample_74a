class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_item,    only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.includes(:item_images, :brands, :shippings).order('created_at DESC')
    @newItems = Item.includes(:item_images).where(buyer_id: nil).limit(3)
    @item = Item.new
    @brand = Brand.new

  end

  def new
    @item = Item.new
    @item.item_images.build
    @brand = Brand.new
    @shipping = Shipping.new
    @category = Category.where(ancestry: nil)
  end

  def category_children  
    @category_children = Category.find(params[:productcategory]).children 
  end
  
  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  def create
    @item = Item.new(item_params)
    @brand = Brand.new(brand_params)
    @shipping = Shipping.new(shipping_params)

    if @item.save
      item_id = @item.id
      @brand = Brand.new(brand_params.merge(item_id: item_id))
      @shipping = Shipping.new(shipping_params.merge(item_id: item_id)) 
      if  @brand.save && @shipping.save
        @item.brand_id = @brand.id
        @item.shipping_id = @shipping.id
        @item.save 
        redirect_to root_path
      else
        redirect_to new_item_path(current_user.id)  
      end
    else
      redirect_to new_item_path(current_user.id)
    end
  end 

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
    @item.item_images.build 
    @categories = @item.category
    @brand = @item.brand
    @shipping = @item.shipping
    
    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update

    @item = Item.find(params[:id])
    @brand = @item.brand
    @shipping = @item.shipping
    binding.pry
    if @item.update(item_params) && @shipping.update(shipping_params) == @brand.update(brand_params)
      redirect_to root_path , notice: '出品情報が更新されました'
    else
      @categories = @item.category
      grandchild_category = @item.category
      child_category = grandchild_category.parent

      @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
      end

      @category_children_array = []
      Category.where(ancestry: child_category.ancestry).each do |children|
        @category_children_array << children
      end

      @category_grandchildren_array = []
      Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
        @category_grandchildren_array << grandchildren
      end

      render :edit
    end
  end
  

  private

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def item_params
      params.require(:item).permit(:brand_id, :shipping_id, :item_name, :price, :size, :content, :category_id, :status_id, :buyer_id, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id, saler_id: current_user.id)
    end   

    def brand_params  
      params.require(:brand).permit(:brand)
    end

    def shipping_params  
      params.require(:shipping).permit(:ship_base_id, :ship_method, :ship_date_id, :prefecture_id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

end

