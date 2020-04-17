class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :random, only: [:index]


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
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path 
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
    category_id_params
    if @item.update(item_params)
      redirect_to root_path
    else 
      redirect_to edit_item_path
    end
  end

  def random
    if user_signed_in?
      @random = Item.where(user_id:(current_user.id)).order("RAND()").limit(1)
    else
    end
  end

  def category
    @category = Item.select('category_id')
  end

  private

  def item_params
    params.require(:item).permit(:name, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def category_id_params
    category = params.permit(:category_id)
    @item[:category_id] = category[:category_id]
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
