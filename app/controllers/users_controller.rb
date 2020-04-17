class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @useritems = Item.where(user_id:(current_user.id))
  end

  def edit
    @user = User.find(current_user.id)
  end

  def uodate
  end
end
