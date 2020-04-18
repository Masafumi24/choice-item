class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :random, only: [:index]
  before_action :set_item, only: [:show, :destroy, :edit, :update,]
  before_action :set_user, only: [:index, :new, :show, :edit, :category]
  before_action :correct_user, only: [:edit, :update ,:destroy]


  def index
    @items = Item.includes(:images, :user)
    if user_signed_in?
      @itemsuser = Item.find_by(user_id:(current_user.id))
      @useritems = Item.where(user_id:(current_user.id))
    else
    end
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["カテゴリーを選択"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
   end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    category_id_params
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path 
  end

  def show
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
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
    category_id_params
    if @item.update(item_params)
      redirect_to root_path
    else 
      redirect_to edit_item_path
    end
  end

  def random
    if user_signed_in?
      # @random = Item.where(user_id:(current_user.id)).order("RAND()").limit(1)
      @random_spring = Item.where(user_id:(current_user.id),spring:present?).order("RAND()").limit(1)
      @random_summer = Item.where(user_id:(current_user.id),summer:present?).order("RAND()").limit(1)
      @random_autumn = Item.where(user_id:(current_user.id),autumn:present?).order("RAND()").limit(1)
      @random_winter = Item.where(user_id:(current_user.id),winter:present?).order("RAND()").limit(1)
    end
  end

  def category
    @category = Item.select('category_id')
  end

  private

  def item_params
    params.require(:item).permit(:name, :brand, :status, :spring, :summer, :autumn, :winter, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def category_id_params
    category = params.permit(:category_id)
    @item[:category_id] = category[:category_id]
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def correct_user
    @current_user_items = current_user.items.find_by(id: params[:id])
      unless @current_user_items
        redirect_to root_url
      end
  end

end
