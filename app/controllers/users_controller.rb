class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @useritems = Item.includes(:images).where(user_id:(current_user.id))
  end
end
